import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_reviews/widgets/rating_star.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/product_reviews/widgets/review_details_container.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/dummy_data.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const TAppBar(title: Text('التقييمات والمراجعات')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Reviews List
              const Text(
                  "التقييمات والمراجعات موثقة وهي من أشخاص يستخدمون نفس نوع الجهاز الذي تستخدمه."),
              const SizedBox(height: 10.0),
              const RatingAndProgressIndicator(),
              const RatingStars(value: 2.5, size: 20.0),
              const Text("12,611"),
              const SizedBox(height: TSizes.spaceBtwSections),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => ReviewDetailsContainer(
                    productReview: TDummyData.productReviews[index]),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: TSizes.spaceBtwSections),
                itemCount: TDummyData.productReviews.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
