import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  bool isSignedIn = false;

  void changeIsSignedIn(bool value) {
    isSignedIn = value;
    update();
  }
}
