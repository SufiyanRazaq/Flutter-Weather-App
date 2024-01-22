import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmproject/ViewModel/Controllers/homeController.dart';

class SmallContainer extends StatefulWidget {
  final String text;
  final String image;
  final Color? color;
  final Color? textColor;
  SmallContainer({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.textColor,
  });

  @override
  State<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends State<SmallContainer> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(widget.image),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
