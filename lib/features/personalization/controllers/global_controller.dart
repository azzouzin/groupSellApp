import 'package:get/get.dart';

class GlobalController extends GetxController {
  bool isClient = true;
  void setType(bool isClient) {
    this.isClient = isClient;
  }
}
