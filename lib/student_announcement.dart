import 'package:flutter/material.dart';
import 'student_chat_user.dart'; // Import StudentChat
import 'student_profile.dart'; // Import StudentProfile

class StudentAnnouncement extends StatelessWidget {
  const StudentAnnouncement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Announcement'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()), // Navigate to Chat widget
              );
            },
            icon: const Icon(Icons.chat_bubble),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentProfile()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sukan Tahunan Sekolah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '14 August 2024 - 15 August 2024',
            ),
            SizedBox(height: 4),
            Text(
              'Makluman bahawa kehadiran adalah wajib',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}