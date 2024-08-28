import 'dart:io';

import 'package:cwt_ecommerce_ui_kit/common/widgets/custom_snackbar.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/controllers/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../models/category_model.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({super.key});

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;
  int pricRangeWidgetCount = 1;
  List<CategoryModel> genderOptions = TDummyData.categories;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافة منتج'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: {
                  'movie_rating': 5,
                  'best_language': 'Dart',
                  'age': 'منتج رقم 1',
                  'gender': TDummyData.categories.firstOrNull,
                  'languages_filter': ['Dart']
                },
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: DateTime.now(),
                      inputType: InputType.both,
                      decoration: InputDecoration(
                        labelText: 'تاريخ الاعلان',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date']
                                ?.didChange(null);
                          },
                        ),
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                    const SizedBox(height: 16),
                    // FormBuilderDateRangePicker(
                    //   name: 'date_range',
                    //   firstDate: DateTime(1970),
                    //   lastDate: DateTime(2030),
                    //   format: DateFormat('yyyy-MM-dd'),
                    //   onChanged: _onChanged,
                    //   decoration: InputDecoration(
                    //     labelText: 'Date Range',
                    //     helperText: 'Helper text',
                    //     hintText: 'Hint text',
                    //     suffixIcon: IconButton(
                    //       icon: const Icon(Icons.close),
                    //       onPressed: () {
                    //         _formKey.currentState!.fields['date_range']
                    //             ?.didChange(null);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 16),

                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (v, r) => pricRangeWidget(),
                      itemCount: pricRangeWidgetCount,
                    ),

                    const SizedBox(height: 16),

                    FloatingActionButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            pricRangeWidgetCount++;
                          });
                        }),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'age',
                      decoration: InputDecoration(
                        labelText: 'اسم المنتج',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey.currentState?.fields['age']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        //     FormBuilderValidators.numeric(),
                        //  FormBuilderValidators.max(70),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),

                    FormBuilderTextField(
                      maxLines: 10,
                      autovalidateMode: AutovalidateMode.always,
                      name: 'age',
                      decoration: InputDecoration(
                        labelText: 'وصف المنتج',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey.currentState?.fields['age']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        //     FormBuilderValidators.numeric(),
                        //  FormBuilderValidators.max(70),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(height: 16),
                    FormBuilderDropdown<CategoryModel>(
                      name: 'gender',
                      decoration: InputDecoration(
                        labelText: 'الفئة',
                        suffix: _genderHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check),
                        hintText: 'Select Gender',
                      ),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: gender,
                                child: Text(gender.name),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _genderHasError = !(_formKey
                                  .currentState?.fields['gender']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text("صور المنتج", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: _imageFiles != null && _imageFiles!.isNotEmpty
                    ? ListView.builder(
                        itemCount: _imageFiles!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              File(_imageFiles![index].path),
                              fit: BoxFit.cover,
                              height: 300,
                            ),
                          );
                        },
                      )
                    : Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 100)),
                            onPressed: () {
                              _pickImages();
                            },
                            child: const Text('اضافة صور للمنتج')),
                      ),
              ),
              SizedBox(
                height: 16,
              ),
              const SizedBox(height: 16),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                onChanged: _onChanged,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'انا موافق على سياسة  ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'الشروط و الخدمة',
                        style: TextStyle(color: Colors.blue),
                        // Flutter doesn't allow a button inside a button
                        // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                        /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation success');
                            Get.back();
                            CustomSnackBar.showCustomToast(
                                message: 'تمت  الاضافة بنجاح');
                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                        child: const Text('اضافة')),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        Get.back();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: const Text('الغاء'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  pricRangeWidget() {
    return Column(
      children: [
        const SizedBox(height: 16),
        FormBuilderSlider(
          name: 'slider',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.min(6),
          ]),
          onChanged: _onChanged,
          min: 0.0,
          max: 10000.0,
          initialValue: 7.0,
          divisions: 20,
          activeColor: Colors.red,
          inactiveColor: Colors.pink[100],
          decoration: const InputDecoration(
            labelText: 'السعر',
          ),
        ),
        const SizedBox(height: 16),
        FormBuilderRangeSlider(
          name: 'range_slider',
          onChanged: _onChanged,
          min: 0.0,
          max: 5000.0,
          initialValue: const RangeValues(4, 7),
          divisions: 20,
          maxValueWidget: (max) => TextButton(
            onPressed: () {
              _formKey.currentState?.patchValue(
                {'range_slider': const RangeValues(4, 100)},
              );
            },
            child: Text(max),
          ),
          activeColor: Colors.red,
          inactiveColor: Colors.pink[100],
          decoration: const InputDecoration(labelText: 'مجال الكميات '),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile>? selectedImages = await _picker.pickMultiImage();
      if (selectedImages != null) {
        setState(() {
          _imageFiles = selectedImages;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }
}
