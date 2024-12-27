import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
class CourseControllers extends GetxController {
  late TextEditingController _courseNameController;

  RxList<String> grades = <String>[].obs;
  RxList<String> courseNames = <String>[].obs;
  Rx<String?> selectedGrade = Rx<String?>(null);
  RxList<String> gradesValue = <String>[
    "A+",
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "D-",
    "F"
  ].obs;
  final StudentController studentController = Get.put(StudentController());
  @override
  void onInit() {
    super.onInit();
    _courseNameController = TextEditingController();
  }
  void AddGpaToFireBase(double Gpa){
    FirebaseFirestore.instance.collection("Student").doc(studentController.email.text).collection("GPa").doc().set({"Gpa":"${Gpa}"}).then((v) {
      Get.snackbar("Success","Gpa has been aded",backgroundColor: Colors.green,);
    }).catchError((e) {});
    ;
  }
  double calculateGpa() {
    Map<String, double> gradeValues = {
      "A+": 4.0,
      "A": 4.0,
      "A-": 3.7,
      "B+": 3.3,
      "B": 3.0,
      "B-": 2.7,
      "C+": 2.3,
      "C": 2.0,
      "C-": 1.7,
      "D+": 1.3,
      "D": 1.0,
      "D-": 0.7,
      "F": 0.0,
    };
    double totalGpa = 0.0;
    for (String grade in grades) {
      totalGpa += gradeValues[grade] ?? 0.0;
    }
    double overallGpa = totalGpa / grades.length;
    return overallGpa != 0 ? overallGpa : 0;
  }
  void storeDataInFirebase(String courseName, String Grade) {
    FirebaseFirestore.instance.collection('Student').doc(studentController.email.text).collection("Course").doc().set({"CourseName": "${courseName}", "Grade": "${Grade}"}).then((v) {
      Get.snackbar("Success","Courses has been aded",backgroundColor: Colors.green,);
    }).catchError((e) {});

  }
  void showDialogue() {
    Get.dialog(
      AlertDialog(
        title: Text(
          "GPA Score",
          style: TextStyle(
            color: Color(0xff2B5FB2),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Container(
          height: 354,
          width: 453,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your total GPA score of the degree program 'degreeName' is",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${calculateGpa().toStringAsFixed(2)}",
                style: TextStyle(
                  color: Color(0xff2B5FB2),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 77,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    AddGpaToFireBase(calculateGpa());
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff22A92F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void showGradeDropDown() {
    Get.bottomSheet(
backgroundColor: Colors.white,
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 500,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Course Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B5FB2),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _courseNameController,
                decoration: InputDecoration(
                  labelText: "Course Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(
                    () => DropdownButtonFormField<String>(
decoration: InputDecoration(
border: OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(10),
),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  )
),
                      borderRadius: BorderRadius.circular(10),
                  value: selectedGrade.value,
                  hint: Text("Select Grade"),
                  items: gradesValue.map((String grade) {
                    return DropdownMenuItem<String>(
                      value: grade,
                      child: Text(grade),
                    );

                  }).toList(),
                  onChanged: (String? newValue) {
                    selectedGrade.value = newValue;
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final courseName = _courseNameController.text;
                    if (courseName.isNotEmpty && selectedGrade.value != null) {
                      courseNames.add(courseName);
                      grades.add(selectedGrade.value!);
                      storeDataInFirebase(courseName,selectedGrade.value!);
                      selectedGrade.value = null;
                      _courseNameController.clear();
                      storeDataInFirebase(courseName,selectedGrade.value!);
                      Get.back();

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2B5FB2),
                  ),
                  child: Text("Add Course",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
      isDismissible: false,
    );
  }
}
