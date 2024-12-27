import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/course_controller.dart';
class CourseDetail extends StatelessWidget {
  final CourseControllers _courseControllers = Get.put(CourseControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Text(
              "Course Details",
              style: TextStyle(
                color: Color(0xff2B5FB2),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return Visibility(
                visible: _courseControllers.courseNames.value.isNotEmpty && _courseControllers.grades.value.isNotEmpty,
                child: ListView.builder(
                  itemCount: _courseControllers.courseNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 38.0, right: 38, top: 10),
                      child: Container(
                        height: 75,
                        width: 254,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff2B5FB2), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                _courseControllers.courseNames[index],
                                style: TextStyle(
                                  color: Color(0xff2B5FB2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Grade: ${_courseControllers.grades[index]}",
                                style: TextStyle(
                                  color: Color(0xff2B5FB2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                replacement: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter your courses and grades 🤷‍♀️",
                        style: TextStyle(
                          color: Color(0xff2B5FB2),
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 77,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: _courseControllers.showGradeDropDown,
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff2B5FB2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 77,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: _courseControllers.showDialogue,
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff22A92F),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
