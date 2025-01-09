import 'package:flutter/material.dart';
import 'student_profile.dart';
import 'student_announcement.dart';
import 'student_chat_user.dart'; // Import the Chat list screen

class StudentChat extends StatelessWidget {
  const StudentChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              // Handle wallet button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentAnnouncement()),
              );
            },
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentProfile()),
              );
            },
          ),
        ],
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Chat(), // Correct: Use the Chat widget as the body
    );
  }
}