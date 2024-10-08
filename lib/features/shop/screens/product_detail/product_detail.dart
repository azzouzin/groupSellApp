import 'package:cwt_ecommerce_ui_kit/features/shop/controllers/cart_controller.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/cart/cart.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/chat/chat_view.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/products/cart/bottom_add_to_cart_widget.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key, required this.product});

  final ProductModel product;
  final productController = ProductController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            ProductImageSlider(product: product),

            /// 2 - Product Details
            Container(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Rating & Share
                  const TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  /// -- Attributes
                  // If Product has no variations do not show attributes as well.
                  if (product.productVariations != null)
                    ProductAttributes(product: product),
                  if (product.productVariations != null)
                    const SizedBox(height: TSizes.spaceBtwSections),
                  Container(
                    width: Get.width, // Width of the progress bar
                    height: 20, // Height of the progress bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Obx(() {
                        return Row(
                          children: [
                            ...List.generate(
                              (productController.cartQuantity.value.toInt() /
                                      100)
                                  .round(),
                              (index) => Container(
                                width: 10,
                                color: Colors.yellow,
                              ),
                            ),
                            // Create colored segments
                          ],
                        );
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          productController.cartQuantity.value.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      }),
                      const Text(
                        "3600  حد الشراء الجماعي",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Checkout Button
                  SizedBox(
                    width: TDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                        child: const Text('اطلب'),
                        onPressed: () {
                          CartController.instance.addSingleItemToCart(
                              product, product.productVariations!.first);
                          Get.to(() => const CartScreen());
                        }),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Chat
                  SizedBox(
                    width: TDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        child: const Text('راسل المتجر'),
                        onPressed: () => Get.to(() => const ChatView())),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(title: 'تفاصيل المنتج'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Read more package
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' اعرض المزيد',
                    trimExpandedText: ' اعرض اقل',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'المراجعات (199)'),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(
                            () => const ProductReviewsScreen(),
                            fullscreenDialog: true),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
