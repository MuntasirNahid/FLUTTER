import 'package:flutter/material.dart';
import 'package:hackathon/screens/studentProfile/widgets/courses_card.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CoursesCard(
            idx: index,
            lessonName: 'Vector Physics',
            teacherName: 'Muntasir Mamun',
          );
        },
      ),
    );
  }
}
