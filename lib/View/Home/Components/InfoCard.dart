import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/Utilities/Utilities.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 233,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 30),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 159, 243, 33).withOpacity(.3),
                  Color.fromARGB(255, 33, 243, 131).withOpacity(.4),
                  const Color.fromARGB(255, 33, 243, 68).withOpacity(.3),
                ],
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: 10,
            child: Obx(
              () => Image.asset(
                controller.getImage(controller.currentIndex.value),
                height: 150,
                width: 170,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              children: [
                Obx(
                  () => Text(
                    controller.getCondition(),
                    style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  Utilities.currentTime(),
                  style: TextStyle(
                      height: 0,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white.withOpacity(.8)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(.1),
                      ],
                    ).createShader(bounds);
                  },
                  child: Obx(
                    () => Text(
                      controller.getCurrentTemp(),
                      style: const TextStyle(
                        fontSize: 60,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    'Feel like ${controller.getFeelLike()}',
                    style: const TextStyle(
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(.1),
                  ],
                ).createShader(bounds);
              },
              child: Image.asset(
                ImageAssets.windWave,
                height: 100,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
