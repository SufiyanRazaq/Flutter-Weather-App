import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: controller.model.value!.days![0].hours!.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.setHour(index),
            child: Column(
              children: [
                Obx(
                  () => Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    shadowColor: controller.compareIndex(index)
                        ? Color.fromARGB(255, 10, 70, 38).withOpacity(.3)
                        : Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Obx(
                      () => Container(
                        height: 130,
                        width: 80,
                        decoration: BoxDecoration(
                          color: controller.compareIndex(index)
                              ? Color.fromARGB(255, 33, 243, 131)
                                  .withOpacity(.3)
                              : Colors.white70,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => Text(
                                  controller.getHour(index),
                                  style: TextStyle(
                                    color: controller.compareIndex(index)
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Image.asset(
                                  controller.getImage(index),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Text(
                                '${controller.model.value!.days![0].hours![index].temp.toInt()}\u00B0',
                                style: TextStyle(
                                  color: controller.compareIndex(index)
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
