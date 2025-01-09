import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<Map<String, dynamic>> students = [
    {'name': 'Simon Joseph', 'present': false},
    {'name': 'Patricia Kelly', 'present': false},
    {'name': 'Ayu Sharifah', 'present': false},
    {'name': 'Daniel Bill', 'present': false},
    {'name': 'Joshua Amie', 'present': false},
    {'name': 'Annette Black', 'present': false},
    {'name': 'Bessie Cooper', 'present': false},
    {'name': 'Darrell Steward', 'present': false},
  ];

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  void _toggleAttendance(int index) {
    setState(() {
      students[index]['present'] = !students[index]['present'];
    });
  }

  void _submitAttendance() {
    // Handle attendance submission
    // You can process the attendance data here
    print("Date: ${_dateController.text}");
    print("Subject: ${_subjectController.text}");
    print(
        "Attendance: ${students.map((s) => '${s['name']}: ${s['present']}').join(', ')}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Today'),
        backgroundColor: Colors.red, // Set the AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Class Subject',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index]['name']),
                    trailing: Checkbox(
                      value: students[index]['present'],
                      onChanged: (value) {
                        _toggleAttendance(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitAttendance,
        backgroundColor: Colors.red,
        child: Icon(Icons.check), // Set the FloatingActionButton color
      ),
    );
  }
}
