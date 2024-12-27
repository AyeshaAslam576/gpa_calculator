import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    email=TextEditingController();
  }

  Rx<String?> selectedProgram = Rx<String?>(null);
  RxList<String> degreePrograms = <String>["BSSE", "BSCS", "BSAI"].obs;
  Rx<String?> gender = Rx<String?>(null);
  RxList<String> genderTypes = <String>["Male", "Female"].obs;
  void SetStudentInfo(String Name,String DegreeProgram){
    FirebaseFirestore.instance.collection("Student").doc(email.text).set({"Name":"${Name}","DegreeProgram":"${DegreeProgram}",}).then((v) {
      Get.snackbar("Success","Data has been stored",backgroundColor: Colors.green);
    }).catchError((e) {});;

  }
}
