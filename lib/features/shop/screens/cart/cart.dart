import 'package:cwt_ecommerce_ui_kit/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/cart_controller.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
          title: Text('عربة التسوق',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              TCartItems(),
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
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Obx(() => Text('اطلب ${controller.totalCartPrice.value}')),
          ),
        ),
      ),
    );
  }
}
