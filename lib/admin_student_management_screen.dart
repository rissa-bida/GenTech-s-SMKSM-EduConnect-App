import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model_admin_student.dart';
import 'student_list_provider.dart';

class StudentManagementScreen extends StatefulWidget {
  const StudentManagementScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentManagementScreenState createState() =>
      _StudentManagementScreenState();
}

class _StudentManagementScreenState extends State<StudentManagementScreen> {
  void _showAddStudentDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final icController = TextEditingController();
    String selectedForm = 'Form 1';
    String selectedSection = 'A';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              TextField(
                controller: icController,
                decoration: InputDecoration(labelText: 'IC Number'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedForm,
                      isExpanded: true,
                      items: [
                        'Form 1',
                        'Form 2',
                        'Form 3',
                        'Form 4',
                        'Form 5',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedForm = newValue;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedSection,
                      isExpanded: true,
                      items: ['A', 'B', 'C', 'D', 'E'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedSection = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text.trim();
                final phoneNumber = phoneController.text.trim();
                final email = emailController.text.trim();
                final icNumber = icController.text.trim();
                final classInfo = '$selectedForm$selectedSection';

                if (name.isNotEmpty &&
                    phoneNumber.isNotEmpty &&
                    email.isNotEmpty &&
                    icNumber.isNotEmpty) {
                  Provider.of<StudentListProvider>(context, listen: false)
                      .addStudent(
                    Studentmodel(
                      id: DateTime.now().hashCode,
                      name: name,
                      phoneNumber: phoneNumber,
                      email: email,
                      classInfo: classInfo,
                      icNumber: icNumber,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddStudentDialog(context),
          ),
        ],
      ),
      body: Consumer<StudentListProvider>(
        builder: (context, studentList, _) {
          return ListView.builder(
            itemCount: studentList.students.length,
            itemBuilder: (context, index) {
              final student = studentList.students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text(
                  '${student.phoneNumber} - ${student.email} - ${student.classInfo}\nIC: ${student.icNumber}',
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    studentList.removeStudent(student);
                  },
                ),
              );
            },
          ); // This closing brace was missing
        },
      ),
    );
  }
}
