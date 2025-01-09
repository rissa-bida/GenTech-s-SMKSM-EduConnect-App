import 'package:flutter/material.dart';
import 'package:smksm_educonnect_app/model_student_user.dart';
import 'package:smksm_educonnect_app/model_teacher_student.dart';
import 'student_profile.dart';
import 'student_chat_screen.dart';
import 'student_announcement.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key, required Student student});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final Map<String, Map<String, String>> grades = {
      'Mid-Term Grades': {
        'Bahasa Melayu': 'A',
        'Bahasa Inggeris': 'B',
        'Sains': 'A',
        'Mathematic': 'D',
        'Pendidikan Moral': 'A',
        'Sejarah': 'A',
      },
      'Final Year Grades': {
        'Bahasa Melayu': 'A+',
        'Bahasa Inggeris': 'C+',
        'Sains': 'A+',
        'Mathematic': 'D+',
        'Pendidikan Moral': 'E',
        'Sejarah': 'A+',
      },
    };

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/studentprofile'),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 40.0,
                              backgroundImage: AssetImage(
                                  'lib/images/kahak.jpg'), // Ensure correct path
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Amir Ahnaf',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Student of class 4A',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications,
                                color: Colors.red),
                            onPressed: () => Navigator.pushNamed(
                                context, '/StudentAnnouncement'),
                          ),
                          IconButton(
                            icon: const _ChatIcon(),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/Chat'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Attendance Info Section
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InfoCard(
                        title: 'Attendance',
                        value: '2024: 100%',
                        width: screenWidth * 0.9,
                      ),
                    ],
                  ),
                ),

                // Grades Display
                ...grades.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(1),
                              },
                              children: entry.value.entries.map((subjectEntry) {
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(subjectEntry.key,
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(subjectEntry.value,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatIcon extends StatelessWidget {
  const _ChatIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.chat, color: Colors.red);
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final double width;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
