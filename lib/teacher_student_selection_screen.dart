import 'package:flutter/material.dart';
import 'teacher_chat_screen.dart';

class StudentSelectionScreen extends StatelessWidget {
  final List<String> students = [
    'Simon Joseph',
    'Patricia Kelly',
    'Ayu Sharifah',
    'Daniel Bill',
    'Joshua Amie',
    'Annette Black',
    'Bessie Cooper',
    'Darrell Steward',
  ];

  StudentSelectionScreen({super.key, required String studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Student'),
        backgroundColor: Colors.red, // Consistent AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  child: Text(
                    students[index][0], // Display the first letter of the name
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                title: Text(students[index]),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TeacherChatScreen(studentName: students[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
