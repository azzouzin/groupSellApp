import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_cart_button.dart';
import '../../../../../common/widgets/products/cart/cart_product_style_01.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final cartItems = cartController.cartItems;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartItems.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Obx(
            () {
              final productTotal = cartController.calculateSingleProductTotal(
                  cartItems[index].price ?? 0, cartItems[index].quantity);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Cart Items
                  TCartProductItemStyle01(
                    id: index.toString(),
                    image: item.image ?? '',
                    brandName: item.brandName ?? '',
                    title: item.title ?? '',
                    attributes: item.selectedVariation ?? {},
                  ),

                  if (!showAddRemoveButtons)
                    const Text(
                      "Fercha Badereddine",
                    ),
                  if (showAddRemoveButtons)
                    const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Add Remove Buttons and Price Total
                  showAddRemoveButtons
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// -- Add Remove Buttons
                            Row(
                              children: [
                                // Use to add space to the left of Buttons as image space.
                                const SizedBox(width: 70),
                                TAddRemoveCartButtons(
                                  quantity: item.quantity,
                                  width: 32,
                                  height: 32,
                                  iconSize: TSizes.md,
                                  removeForegroundColor:
                                      THelperFunctions.isDarkMode(context)
                                          ? TColors.white
                                          : TColors.black,
                                  removeBackgroundColor:
                                      THelperFunctions.isDarkMode(context)
                                          ? TColors.darkerGrey
                                          : TColors.light,
                                  addBackgroundColor: TColors.primary,
                                  add: () =>
                                      cartController.updateCartItemQuantity(
                                          item, item.quantity + 1),
                                  remove: () =>
                                      cartController.updateCartItemQuantity(
                                          item, item.quantity - 1),
                                ),
                              ],
                            ),

                            /// -- Product total price
                            TProductPriceText(price: productTotal.toString()),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Use to add space to the left of Buttons as image space.
                            Row(
                              children: [
                                const SizedBox(width: 70),
                                Text("${item.quantity} قطعة",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            TProductPriceText(price: productTotal.toString()),
                          ],
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
