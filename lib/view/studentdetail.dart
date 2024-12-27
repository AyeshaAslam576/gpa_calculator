import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
import '../routes/screenroutes.dart';

class StudentDetail extends StatelessWidget {
  StudentDetail({Key? key}) : super(key: key);

  final StudentController studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  "Student Details",
                  style: TextStyle(
                    color: Color(0xff2B5FB2),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 20, left: 20, bottom: 10),
                child: Container(
                  height: 55,
                  width: 354,
                  child: TextFormField(
                    controller: studentController.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff2B5FB2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff2B5FB2),
                        ),
                      ),
                      hintText: "Student Name",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 20, left: 20, bottom: 10),
                child: Container(
                  height: 55,
                  width: 354,
                  child: TextFormField(
                    controller: studentController.email,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff2B5FB2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff2B5FB2),
                        ),
                      ),
                      hintText: "Student Email",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  height: 55,
                  width: 354,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2B5FB2), width: 1),
                  ),
                  child: Obx(
                        () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: studentController.selectedProgram.value,
                        hint: Text("  Degree Program"),
                        onChanged: (String? value) {
                          studentController.selectedProgram.value = value;
                        },
                        items: studentController.degreePrograms
                            .map((String program) {
                          return DropdownMenuItem(
                            value: program,
                            child: Text(" $program"),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0, top: 10),
                child: Obx(
                      () => Row(
                    children: [
                      RadioMenuButton(
                        value: studentController.genderTypes[0],
                        groupValue: studentController.gender.value,
                        onChanged: (value) {
                          studentController.gender.value = value as String?;
                        },
                        child: Text("Male"),
                      ),
                      RadioMenuButton(
                        value: studentController.genderTypes[1],
                        groupValue: studentController.gender.value,
                        onChanged: (value) {
                          studentController.gender.value = value as String?;
                        },
                        child: Text("Female"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
              child: SizedBox()),
              Container(
                height: 75,
                width: 354,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (studentController.selectedProgram.value != null &&
                        studentController.name.text.isNotEmpty &&studentController.email.text.isNotEmpty) {
                      studentController.SetStudentInfo(studentController.name.text, studentController.selectedProgram.value!);
                      Get.offNamed(ScreenRouts.courseDetails);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseDetail(studentController.selectedProgram.value!)));
                    } else {
                      Get.snackbar(
                        "Warning",
                        "Please select a degree program and enter your name",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green
                      );
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2B5FB2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
