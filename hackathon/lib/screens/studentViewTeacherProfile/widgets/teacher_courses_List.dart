import 'package:flutter/material.dart';
import 'package:hackathon/screens/studentViewTeacherProfile/widgets/student_view_courses_card.dart';

class StudentViewTeacherCourseList extends StatefulWidget {
  const StudentViewTeacherCourseList({super.key});

  @override
  State<StudentViewTeacherCourseList> createState() => _StudentViewTeacherCourseListState();
}

class _StudentViewTeacherCourseListState extends State<StudentViewTeacherCourseList> {
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
          return StudentViewCoursesCard(
            idx: index,
            lessonName: 'Vector Physics',
            teacherName: 'Muntasir Mamun',
          );
        },
      ),
    );
  }
}
