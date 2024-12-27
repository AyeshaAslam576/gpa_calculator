import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/logo.png"),
            Text(
              "GPA\nCalculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2B5FB2),
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            //SizedBox(height: 30),
            SpinKitSpinningLines(
              color: Color(0xff2B5FB2),
              size: 50,
              itemCount: 5,
              duration: Duration(milliseconds: 1200),
            ),
          ],
        ),
      ),
    );
  }
}
