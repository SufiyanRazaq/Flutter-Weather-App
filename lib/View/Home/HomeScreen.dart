import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Colors/colors.dart';
import 'package:mvvmproject/View/Home/Components/appBar.dart';
import 'package:mvvmproject/View/Home/Components/InfoCard.dart';
import 'package:mvvmproject/View/Home/Components/container.dart';
import 'package:mvvmproject/View/Home/Components/hoursList.dart';
import 'package:mvvmproject/View/Home/Components/location.dart';
import 'package:mvvmproject/View/NextDays/next14Days.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Location(),
                  Hero(
                    tag: 'TAG',
                    child:
                        Material(color: Colors.transparent, child: InfoCard()),
                  ),
                  ContainerList(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(
                      () => NextDays(),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Next 14 Days >',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HoursList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
