import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/splash_view/loading.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Begin fading in the logo and text after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });

      // Trigger navigation after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(const Loading());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                AppImages.splashview,
                width: 300,
                color: Constants.buttoncolor,
              ),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                "make your life easier",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
