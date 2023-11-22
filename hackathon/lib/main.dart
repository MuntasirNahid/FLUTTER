import 'package:flutter/material.dart';
import 'package:hackathon/screens/AdminHomePage/admin_home_page.dart';
import 'package:hackathon/screens/Experts/experts.dart';
import 'package:hackathon/screens/comment/comments.dart';
import 'package:hackathon/screens/studentHomePage/home_page.dart';
import 'package:hackathon/screens/addNewCourse/add_new_course.dart';
import 'package:hackathon/screens/postQuestion/post_question.dart';
import 'package:hackathon/screens/role_selection/role_selection.dart';
import 'package:hackathon/screens/studentProfile/student_profile.dart';
import 'package:hackathon/screens/studentViewTeacherProfile/student_view_teacher_profile.dart';
import 'package:hackathon/screens/teacherHomePage/teacher_home_page.dart';
import 'package:hackathon/screens/teacherProfile/teacher_profile.dart';
import 'package:hackathon/screens/verificationRequest/verification_req.dart';

import 'constants/app_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Comments(),
      theme: ThemeData(
        fontFamily: mainFontFamily,
        // scrollbarTheme: ScrollbarThemeData(
        //   thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
        //   trackColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
        // ),
      ),
    );
  }
}
