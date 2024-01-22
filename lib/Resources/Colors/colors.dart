import 'package:flutter/material.dart';

class AppColors {
  static BoxDecoration buildGradientBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white24, Color.fromARGB(255, 76, 101, 175)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }
}
