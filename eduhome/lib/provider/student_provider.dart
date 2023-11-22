import 'package:ui_ux/models/Student.dart';


class StudentUser {
  static Student? currentStudent;

  static Student? getCurrentStudentUser() {
    return StudentUser.currentStudent;
  }
}
