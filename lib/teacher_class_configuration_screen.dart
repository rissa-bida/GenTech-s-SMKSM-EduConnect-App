import 'package:flutter/material.dart';
import 'teacher_learning_materials_screen.dart';
import 'teacher_chat_screen.dart';
import 'teacher_student_selection_screen.dart';
import 'teacher_class_configuration_screen.dart'; // Import the class configuration screen
import 'teacher_edit_profile_screen.dart'; // Import the edit profile screen
import 'teacher_grade_screen.dart';
import 'teacher_announcement_screen.dart';
import 'teacher_attendance_screen.dart'; // Import the attendance screen

class ClassConfigurationScreen extends StatelessWidget {
  final String userType;

  const ClassConfigurationScreen(
      {super.key, required this.userType, required String className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'images/smksmlogo.png',
              height: 150,
            ),
            const SizedBox(height: 20.0),

            // Title
            const Text(
              'SMK SUNGAI MERAH\nAdmin Dashboard',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100.0),

            // Learning Materials Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LearningMaterialsScreen(),
                  ),
                );
              },
              child: const Text(
                'Learning Materials',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0), // Increased spacing

            // Announcement Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnnouncementScreen(),
                  ),
                );
              },
              child: const Text(
                'Announcement',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0), // Increased spacing

            // Student Grade Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GradeScreen(),
                  ),
                );
              },
              child: const Text(
                'Student Grades',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0), // Increased spacing

            // Student Attendance Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendanceScreen(),
                  ),
                );
              },
              child: const Text(
                'Student Attendance',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0), // Increased spacing

            // Chat Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentSelectionScreen(
                      studentName: '',
                    ),
                  ),
                );
              },
              child: const Text(
                'Chat',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0) // Increased spacing
          ],
        ),
      ),
    );
  }
}
