import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smksm_educonnect_app/model_teacher_student.dart';
import 'student_dashboard.dart';
import 'home_loginadmin.dart';
import 'home_loginteacher.dart';
import 'home_loginstudent.dart';
import 'student_profile.dart';
import 'student_chat_user.dart';
import 'student_announcement.dart';
import 'student_editprofile.dart';
import 'admin_dashboard.dart';
import 'model_admin_student.dart';
import 'teacher_profile_screen.dart';
import 'student_list_provider.dart'; // Import the provider
import 'admin_teacher_provider.dart'; // Import the provider

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentListProvider()),
        ChangeNotifierProvider(create: (_) => TeacherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginSelectionScreen(),
          '/loginadmin': (context) => Loginadmin(),
          '/adminDashboard': (context) => AdminDashboard(),
          '/loginteacher': (context) => TeacherLoginRoute(),
          '/loginstudent': (context) => StudentLoginRoute(),
          '/student': (context) => StudentDashboardScreen(
              student: Student(
                  id: 0,
                  name: '',
                  phoneNumber: '',
                  email: '',
                  classInfo: '',
                  icNumber: '')),
          '/studentprofile': (context) => const StudentProfile(),
          '/Chat': (context) => const Chat(),
          '/StudentAnnouncement': (context) => const StudentAnnouncement(),
          '/StudentEditProfile': (context) => const StudentEditProfile(),
          '/teacherprofile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Selection'),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('images/smksmlogo.png'),
              height: 100.0,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginadmin');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Admin Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/loginteacher'); // Navigate to teacher login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Teacher Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginstudent');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Student Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentLoginRoute extends StatelessWidget {
  const StudentLoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Loginstudent(onLoginSuccess: () {
      Navigator.pushReplacementNamed(context, '/student');
    });
  }
}

class TeacherLoginRoute extends StatelessWidget {
  const TeacherLoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    print("TeacherLoginRoute build method called");
    return Loginteacher(onLoginSuccess: () {
      print("onLoginSuccess callback in TeacherLoginRoute called");
      Navigator.pushReplacementNamed(context, '/teacherprofile');
    });
  }
}
