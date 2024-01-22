import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Colors/colors.dart';
import 'package:mvvmproject/View/NextDays/Components/appBar.dart';
import 'package:mvvmproject/View/NextDays/Components/buttonList.dart';
import 'package:mvvmproject/View/NextDays/Components/centerCard.dart';
import 'package:mvvmproject/View/NextDays/Components/dayList.dart';
import 'package:mvvmproject/ViewModel/Controllers/daysController.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class NextDays extends StatelessWidget {
  NextDays({super.key});
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 1,
                  child: Container(
                    height: size.height / 1.8,
                    width: size.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomAppBar2(),
                        const SizedBox(
                          height: 20,
                        ),
                        DayList(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: Container(
                    height: size.height / 1.9,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                BottomList(),
                CenterCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
