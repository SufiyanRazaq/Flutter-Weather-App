import 'package:get/get.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class SplashServices {
  static void getApiData() {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}
