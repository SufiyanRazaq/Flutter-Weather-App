import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/View/Home/Components/smallContainer.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => SmallContainer(
              text: '${controller.getCloudOver()}%',
              image: ImageAssets.heavyRain,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getWindSpeed()}Km/h',
              image: ImageAssets.wind,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => SmallContainer(
              text: '${controller.getHumidity()}%',
              image: ImageAssets.sun,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
