import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/Utilities/Utilities.dart';
import 'package:mvvmproject/View/NextDays/Components/smallContainerList.dart';
import 'package:mvvmproject/ViewModel/Controllers/daysController.dart';

import '../../../ViewModel/Controllers/homeController.dart';

class CenterCard extends StatelessWidget {
  CenterCard({super.key});
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 440,
      width: size.width,
      margin: const EdgeInsets.only(
        top: 60,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            right: 30,
            left: 30,
            child: Container(
              width: size.width,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 33, 243, 96).withOpacity(.7),
                    Color.fromARGB(255, 96, 33, 243).withOpacity(.5),
                    const Color.fromARGB(255, 33, 243, 54).withOpacity(.7),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
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
                                Colors.white.withOpacity(.5),
                              ],
                            ).createShader(bounds);
                          },
                          child: Obx(
                            () => Text(
                              '${controller.day.value.temp.toInt().toString()}\u0800',
                              style: const TextStyle(
                                fontSize: 65,
                                height: 0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            'Feel like${controller.day.value.feelslike}',
                            style: const TextStyle(
                              height: 0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Obx(
                            () => Text(
                              controller.day.value.conditions,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            Utilities.currentTime(),
                            style: TextStyle(
                              fontSize: 15,
                              height: 0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.5),
                          ],
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        ImageAssets.windWave,
                        height: 130,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: SizedBox(
                      width: size.width - 60,
                      child: SmallContainerList(),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    top: 1,
                    child: Obx(
                      () => Image.asset(
                        controller.getImage(controller.currentDay.value),
                        height: 190,
                        width: 190,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
