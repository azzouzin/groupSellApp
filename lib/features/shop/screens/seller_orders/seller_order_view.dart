import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
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
              Text("كل الطلبيات بلغت حد الشراء الجماعي للمنتج",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Items in Cart
              TCartItems(
                showAddRemoveButtons: false,
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
            onPressed: () {},
            child: Text('شحن الطلبية'),
          ),
        ),
      ),
    );
  }
}
