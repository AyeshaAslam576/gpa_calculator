import 'package:get/get.dart';
import '../view/coursedetail.dart';
import '../view/splashscreen.dart';
import '../view/studentdetail.dart';

class ScreenRouts{
  static const String splashScreen="/splashScreen";
  static const String courseDetails="/courseDetails";
  static const String studentDetails="/studentDetails";

  static final List<GetPage> mypages = [

    GetPage(name: splashScreen, page: ()=> Splashscreen()),
    GetPage(name: courseDetails, page: ()=> CourseDetail()),
    GetPage(name: studentDetails, page: ()=> StudentDetail())
  ];
}
