import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/ViewModel/Controllers/daysController.dart';

class DayList extends StatelessWidget {
  DayList({super.key});

  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 130,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.homeController.model.value!.days!.length,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                    onTap: () => controller.setDay(index),
                    child: Container(
                      width: 70,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: controller.currentDay.value == index
                            ? Colors.white
                            : Colors.white12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              controller.getImage(index),
                            ),
                          ),
                          Text(
                            controller.getMonth(index),
                            style: TextStyle(
                              color: controller.currentDay.value == index
                                  ? Colors.purple
                                  : Colors.white,
                              height: 0,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.getMonthDay(index),
                            style: TextStyle(
                              color: controller.currentDay.value == index
                                  ? Colors.purple
                                  : Colors.white,
                              height: 0,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
