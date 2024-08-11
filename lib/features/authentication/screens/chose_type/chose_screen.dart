import 'package:cwt_ecommerce_ui_kit/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_strings.dart';

class ChoseScreen extends StatelessWidget {
  const ChoseScreen({super.key});

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
                    Get.to(LoginScreen());
                  },
                  child: const Text(TTexts.buyer)),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
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
