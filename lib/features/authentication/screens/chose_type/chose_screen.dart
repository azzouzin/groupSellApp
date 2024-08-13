import 'package:cwt_ecommerce_ui_kit/features/authentication/screens/login/login.dart';
import 'package:cwt_ecommerce_ui_kit/features/personalization/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_strings.dart';

class ChoseScreen extends StatelessWidget {
  ChoseScreen({super.key});
  GlobalController globalController = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    globalController.setType(true);

                    Get.to(LoginScreen());
                  },
                  child: const Text(TTexts.buyer)),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  globalController.setType(false);
                  Get.to(LoginScreen());
                },
                child: Text(TTexts.seller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
