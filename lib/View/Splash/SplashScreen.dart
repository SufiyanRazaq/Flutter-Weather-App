import 'package:flutter/material.dart';
import 'package:mvvmproject/Resources/Image/image.dart';
import 'package:mvvmproject/Resources/Colors/colors.dart';
import 'package:mvvmproject/ViewModel/Services/Splash/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Image.asset(
          ImageAssets.nightStartRain,
          height: 200,
          width: 200,
        )),
      ),
    );
  }
}
