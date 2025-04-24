import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePage(index) {
    carouselCurrentIndex.value = index;
  }
}
