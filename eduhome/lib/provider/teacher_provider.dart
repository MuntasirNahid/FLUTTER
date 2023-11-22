
import '../models/Teacher.dart';

class TeacherUser {
  static Teacher? currentTeacher;

  static Teacher? getCurrentTeacherUser() {
    return TeacherUser.currentTeacher;
  }
}
