import 'package:flutter/foundation.dart';
import 'model_admin_teacher.dart';

class TeacherProvider extends ChangeNotifier {
  List<Teacher> _teachers = [];

  List<Teacher> get teachers => _teachers;

  void addTeacher(Teacher teacher) {
    _teachers.add(teacher);
    notifyListeners();
  }

  void removeTeacher(Teacher teacher) {
    _teachers.remove(teacher);
    notifyListeners();
  }
}
