import 'package:cwt_ecommerce_ui_kit/utils/constants/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/shop/models/commune.dart';
import '../../global_controller.dart';

class CommuneDropDownButton extends StatelessWidget {
  CommuneDropDownButton({super.key, required this.onChanged});
  GlobalController staticsController = Get.put(GlobalController());
  TextEditingController wilayaController = TextEditingController();
  TextEditingController communeController = TextEditingController();
  final Function() onChanged;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "البلدية",
            style: const TextStyle(
              fontSize: 16,
              //fontFamily: "Assaf",
              fontWeight: FontWeight.w700,
              color: TColors.primary,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<Commune>(
              isExpanded: true,
              hint: Text(
                'البلدية',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: staticsController.communeList.communeList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.arName!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: TColors.textPrimary),
                      ),
                    ),
                  )
                  .toList(),
              value: staticsController.selctedCommune,
              onChanged: (value) {
                staticsController.changeSelctedCommune(value!);
                onChanged();
              },
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                height: 40,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: TColors.primary,
                  ),
                ),
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 500,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: TColors.primary,
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 50,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: wilayaController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: TColors.accent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: wilayaController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'ابحث عن بلديتك',
                      hintStyle: const TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value!.arName
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  wilayaController.clear();
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
