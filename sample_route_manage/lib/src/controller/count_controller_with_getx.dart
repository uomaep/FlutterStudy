import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  static CountControllerWithGetx get to => Get.find();
  int count = 0;
  void increase() {
    count++;
    update();
  }
}
