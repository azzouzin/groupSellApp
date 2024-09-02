import 'package:cwt_ecommerce_ui_kit/features/personalization/controllers/global_controller.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/chat/messege_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/user/user_appbar_profile_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../personalization/screens/profile/profile.dart';
import '../cart/cart.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  GlobalController globalController = Get.put(GlobalController());
  TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {
      "isClient": true,
      "text": "مرحبا كيف حالك؟",
      "time": "10:00",
    },
    {
      "isClient": false,
      "text": "مرحبا بك كيف اقوم بخدمتك؟",
      "time": "10:00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: TSizes.defaultSpace),

                    const TCircularImage(
                        image: TImages.user, width: 50, height: 50),

                    /// -- Appbar
                    Expanded(
                      child: TUserAppBarProfileCard(
                          title:
                              !globalController.isClient ? "العميل" : "البائع",
                          subTitle: "Fercha  Badereddine",
                          userCardOnPressed: () =>
                              Get.to(() => ProfileScreen()),
                          actionButtonOnPressed: () {}),
                    ),
                  ],
                ),
                // const SizedBox(height: TSizes.spaceBtwSections),

                /*  const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                  child: THeaderSearchContainer(showBackground: true),
                ),
                */
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- Categories
                // const THeaderCategories(),
                //  const SizedBox(height: TSizes.spaceBtwSections * 2),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: messages
                  .map((e) => MessegeCard(
                        messege: e["text"],
                        isClient: e["isClient"],
                      ))
                  .toList(),
            ),
          ),
          //   Expanded(child: Container()),
          textField(),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }

  Widget textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _messageController,
        decoration: InputDecoration(
          hintText: 'اكتب رسالتك',
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                messages.add({
                  "isClient": true,
                  "text": _messageController.text,
                  "time": "10:00",
                });
              });
              _messageController.clear();
            },
            child: Icon(Iconsax.send_1,
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.grey
                    : TColors.darkGrey),
          ),
        ),
      ),
    );
  }
}
