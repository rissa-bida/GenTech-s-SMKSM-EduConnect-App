import 'package:flutter/foundation.dart';
import 'model_admin_student.dart';

class StudentListProvider extends ChangeNotifier {
  List<Studentmodel> _students = [];

  List<Studentmodel> get students => _students;

  void addStudent(Studentmodel student) {
    _students.add(student);
    notifyListeners();
  }

  void removeStudent(Studentmodel student) {
    _students.remove(student);
    notifyListeners();
  }
}