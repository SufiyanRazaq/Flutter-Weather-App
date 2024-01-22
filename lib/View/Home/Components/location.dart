import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/Utilities/Utilities.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.getAddress(),
              style: const TextStyle(
                height: 0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              Utilities.formateDate(DateTime.now()),
              style: TextStyle(
                color: Colors.grey.withOpacity(.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImageAssets.maps,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
