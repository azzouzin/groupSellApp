import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../search/search.dart';

class THeaderSearchContainer extends StatelessWidget {
  const THeaderSearchContainer({
    super.key,
    this.showBackground = false,
    this.showBorder = false,
    this.text = 'Search in Store',
    this.icon = Iconsax.search_normal,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final bool showBackground, showBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap == null ? Get.to(() => const SearchScreen()) : onTap!();
      },
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            border: showBorder ? Border.all(color: TColors.grey) : null,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            color: showBackground
                ? THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon,
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.grey
                    : TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
