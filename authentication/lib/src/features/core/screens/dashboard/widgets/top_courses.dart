import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'top_course_indiv.dart';

class DashBoradTopCourses extends StatelessWidget {
  const DashBoradTopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          topCourseIndividual(
              txtTheme: txtTheme,
              heading: '3 classes',
              title: 'Flutter Crash Course',
              subHeading: 'Programming language ',
              picturePath: welcomeScreenImage),
          SizedBox(
            width: dashBoardCardPadding,
          ),
          topCourseIndividual(
              txtTheme: txtTheme,
              heading: '4 classes',
              title: 'Python Crash Course',
              subHeading: 'Programming language ',
              picturePath: welcomeScreenImage),
          SizedBox(
            width: dashBoardCardPadding,
          ),
          topCourseIndividual(
              txtTheme: txtTheme,
              heading: '3 classes',
              title: 'Dart Crash Course',
              subHeading: 'Programming language ',
              picturePath: welcomeScreenImage),
        ],
      ),
    );
  }
}
