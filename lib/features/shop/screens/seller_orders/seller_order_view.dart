import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/screens/address/widgets/single_address_widget.dart';
import '../../controllers/dummy_data.dart';
import '../cart/widgets/cart_items.dart';

class SellerOrderView extends StatelessWidget {
  const SellerOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
          title: Text('الطلبيات',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              TCartItems(
                showAddRemoveButtons: false,
              ),
              Column(
                children: TDummyData.user.addresses!
                    .take(1)
                    .map((address) => TSingleAddressWidget(
                          address: address,
                          onTap: () {
                            //  selectedAddress.value = address;
                            // Get.back();
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              CustomSnackBar.showCustomSnackBar(
                  title: 'تمت عملية الشحن بنجاح',
                  message: "تمت عملية الشحن بنجاح");
            },
            child: Text('شحن الطلبية'),
          ),
        ),
      ),
    );
  }
}
