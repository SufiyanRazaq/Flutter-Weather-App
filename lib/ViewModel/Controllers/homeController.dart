import 'dart:async';

import 'package:mvvmproject/Model/dataModel.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Repository/homeRepository.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/Utilities/Utilities.dart';
import 'package:mvvmproject/View/Home/HomeScreen.dart';

class HomeController extends GetxController {
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;

  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) => Utilities.formateTimewithoutAmPm(
        model.value!.days![0].hours![index].datetime.toString(),
      );
  String getImage(int index) => Utilities().imageMap[
              model.value!.days![0].hours![index].datetime.toString()] ==
          null
      ? ImageAssets.nightStartRain
      : Utilities()
          .imageMap[model.value!.days![0].hours![index].conditions.toString()]!;
  String getAddress() =>
      '${model.value!.address.toString()}. \n${model.value!.timezone.toString()}';
  String getCondition() => hours.value!.conditions.toString();
  String getCurrentTemp() => hours.value!.temp!.toInt().toString();
  String getFeelLike() => hours.value!.feelslike.toString();
  String getCloudOver() => hours.value!.cloudcover!.toInt().toString();
  String getWindSpeed() => hours.value!.windspeed!.toInt().toString();
  String getHumidity() => hours.value!.humidity!.toInt().toString();

  getData() {
    HomeRepository.hitApi().then((value) {
      model.value = DataModel.fromJson(value);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
        if (Utilities.checkTime(
            model.value!.days![0].hours![i].datetime.toString())) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
      Get.to(const HomeScreen());
    });
  }

  setHour(int index) {
    Timer(const Duration(milliseconds: 100), () => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100), () => animator.value = false);
  }
}
