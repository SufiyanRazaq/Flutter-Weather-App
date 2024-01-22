import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/View/Home/Components/smallContainer.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

import '../../../ViewModel/Controllers/daysController.dart';

class SmallContainerList extends StatelessWidget {
  SmallContainerList({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SmallContainer(
          text: '${controller.day.value.precipprob.toInt().toString()}%',
          image: ImageAssets.heavyRain,
          color: Colors.white38,
          textColor: Colors.white,
        ),
        const Spacer(),
        SmallContainer(
          text: '${controller.day.value.windspeed.toInt().toString()}Km/h',
          image: ImageAssets.wind,
          color: Colors.white38,
          textColor: Colors.white,
        ),
        const Spacer(),
        SmallContainer(
          text: '${controller.day.value.humidity.toInt().toString()}Km/h',
          image: ImageAssets.sun,
          color: Colors.white38,
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }
}
