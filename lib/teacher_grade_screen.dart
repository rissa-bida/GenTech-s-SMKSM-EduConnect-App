import 'package:flutter/material.dart';
import 'model_teacher_student.dart';
import 'model_teacher_grade.dart';

class GradeScreen extends StatefulWidget {
  const GradeScreen({super.key});

  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  final List<String> examTypes = [
    '1st Exam',
    'Mid-Term',
    '2nd Exam',
    'Final Year'
  ];
  String selectedExamType = '1st Exam'; // Default value

  final List<Student> students = [
    Student(
        id: 1,
        name: 'Simon Joseph',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 2,
        name: 'Patricia Kelly',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 3,
        name: 'Ayu Sharifah',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 4,
        name: 'Daniel Bill',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 5,
        name: 'Joshua Amie',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 6,
        name: 'Annette Black',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 7,
        name: 'Bessie Cooper',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
    Student(
        id: 8,
        name: 'Darrell Steward',
        phoneNumber: '',
        email: '',
        classInfo: '',
        icNumber: ''),
  ];

  final List<Grade> grades = [];
  String? newGrade; // Variable to hold the new grade input

  void _addGrade(int studentId, String grade) {
    setState(() {
      final existingGrade = grades.firstWhere(
        (g) => g.studentId == studentId.toString(),
        orElse: () {
          final newGradeEntry = Grade(
            studentId: studentId.toString(),
            classId: '4A', // Example class ID
            subject: 'Biology', // Example subject
            grade: '',
            examType: selectedExamType, // Use selected exam type
          );
          grades.add(newGradeEntry);
          return newGradeEntry;
        },
      );
      existingGrade.grade = grade; // Update the grade
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Class 4A Grade')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedExamType,
            items: examTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedExamType = newValue!;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                final studentGrade = grades.firstWhere(
                  (g) => g.studentId == student.id.toString(),
                  orElse: () => Grade(
                    studentId: student.id.toString(),
                    classId: '4A',
                    subject: 'Biology',
                    grade: '',
                    examType: selectedExamType,
                  ),
                );

                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(
                      'Grade: ${studentGrade.grade} - Exam: ${studentGrade.examType}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TextField for manual grade input
                      SizedBox(
                        width: 60,
                        child: TextField(
                          onChanged: (value) {
                            newGrade = value; // Capture the input grade
                          },
                          decoration: InputDecoration(
                            hintText: 'Grade',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (newGrade != null && newGrade!.isNotEmpty) {
                            _addGrade(
                                student.id, newGrade!); // Use the input grade
                          }
                        },
                        child: Text('Add Grade'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
