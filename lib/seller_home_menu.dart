import 'package:cwt_ecommerce_ui_kit/features/shop/screens/addproduct/add_product.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/chat/chat_view.dart';
import 'package:cwt_ecommerce_ui_kit/features/shop/screens/seller_orders/seller_order_view.dart';
import 'package:cwt_ecommerce_ui_kit/utils/constants/colors.dart';
import 'package:cwt_ecommerce_ui_kit/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personalization/screens/setting/settings.dart';
import 'features/shop/screens/chat/users_view.dart';
import 'features/shop/screens/favourites/favourite.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/seller_orders/order_list_view.dart';
import 'features/shop/screens/store/store.dart';

class SellerHomeMenu extends StatelessWidget {
  const SellerHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenSellerController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Iconsax.add, color: TColors.white),
          onPressed: () {
            Get.to(CompleteForm());
          }),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : Colors.white,
          elevation: 0,
          indicatorColor: THelperFunctions.isDarkMode(context)
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'الطلبيات'),
            NavigationDestination(
                icon: Icon(Iconsax.message), label: 'الرسائل'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenSellerController extends GetxController {
  static AppScreenSellerController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [
    OrdersListView(),
    UsersView(),
  ];
}
