import 'package:cwt_ecommerce_ui_kit/features/authentication/screens/login/login.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/billing_amount_section.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/dummy_data.dart';
import '../cart/widgets/cart_items.dart';
import 'checkout_successful.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Scaffold(
      appBar: const TAppBar(title: Text('مراجعة الطلب')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCodeWidget(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(subTotal: subTotal),

                    /// Divider
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Address
                    TBillingAddressSection(
                      name: TDummyData.user.fullName,
                      phoneNumber: TDummyData.user.formattedPhoneNo,
                      address: TDummyData.user.addresses.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
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
              userController.isSignedIn
                  ? Get.to(CheckoutSuccessfulScreen())
                  : Get.to(() => const LoginScreen());
            },
            child: Text(
                'اطلب الان DZ${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}'),
          ),
        ),
      ),
    );
  }
}
