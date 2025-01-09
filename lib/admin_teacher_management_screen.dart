import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model_admin_teacher.dart';
import 'admin_teacher_provider.dart';

class TeacherManagementScreen extends StatefulWidget {
  @override
  _TeacherManagementScreenState createState() =>
      _TeacherManagementScreenState();
}

class _TeacherManagementScreenState extends State<TeacherManagementScreen> {
  void _showAddTeacherDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final icController = TextEditingController();
    final subjectController = TextEditingController();
    String selectedForm = 'Form 1';
    String selectedSection = 'A';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Teacher'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Teacher Name'),
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
              TextField(
                controller: subjectController,
                decoration: InputDecoration(labelText: 'Subject Teaches'),
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
                final id = DateTime.now().hashCode;
                final name = nameController.text.trim();
                final phoneNumber = phoneController.text.trim();
                final email = emailController.text.trim();
                final icNumber = icController.text.trim();
                final subject = subjectController.text.trim();
                final classAssigned = '$selectedForm$selectedSection';

                if (name.isNotEmpty &&
                    phoneNumber.isNotEmpty &&
                    email.isNotEmpty &&
                    icNumber.isNotEmpty &&
                    subject.isNotEmpty) {
                  Provider.of<TeacherProvider>(context, listen: false)
                      .addTeacher(
                    Teacher(
                      id: id,
                      name: name,
                      phoneNumber: phoneNumber,
                      email: email,
                      icNumber: icNumber,
                      subject: subject,
                      classAssigned: classAssigned,
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
        title: Text('Teachers Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddTeacherDialog(context);
            },
          ),
        ],
      ),
      body: Consumer<TeacherProvider>(
        builder: (context, teacherProvider, _) {
          return ListView.builder(
            itemCount: teacherProvider.teachers.length,
            itemBuilder: (context, index) {
              final teacher = teacherProvider.teachers[index];
              return ListTile(
                title: Text(teacher.name),
                subtitle: Text(
                  '${teacher.phoneNumber} - ${teacher.email} - ${teacher.classAssigned}\nSubject Teach: ${teacher.subject}\nIC: ${teacher.icNumber}',
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    teacherProvider.removeTeacher(teacher);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
