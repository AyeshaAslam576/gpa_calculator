import 'dart:async';
import 'package:get/get.dart';
import '../routes/screenroutes.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  void startTimer() {
    print("Timer Called");
    Timer(Duration(seconds: 3), navigateToNextScreen);
  }
  void navigateToNextScreen() {
    Get.offNamed(ScreenRouts.studentDetails);
  }
}