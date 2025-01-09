import 'package:flutter/material.dart';
import 'model_student_user.dart'; // Make sure this path is correct

class StudentEditProfile extends StatefulWidget {
  const StudentEditProfile({Key? key}) : super(key: key);

  @override
  State<StudentEditProfile> createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  final _formKey = GlobalKey<FormState>();
  late UserData _userData;

  @override
  void initState() {
    super.initState();
    _userData = UserData.currentUser.copy(); // Initialize with a copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Removed image picker section
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network( // Display network image directly
                        _userData.profilePicture, // Assuming profilePicture is a URL
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.person, size: 80), // Placeholder if image fails to load
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text('Student',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),
              _buildTextField('Name', (value) => _userData.name = value),
              const SizedBox(height: 16),
              _buildTextField('Phone', (value) => _userData.phoneNumber = value),
              const SizedBox(height: 16),
              _buildTextField('Email', (value) => _userData.email = value),
              const SizedBox(height: 16),
              _buildTextField('Address', (value) => _userData.address = value),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.red)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        UserData.currentUser = _userData.copy(); // Update current user
                        Navigator.pop(context, true); // Return true to indicate changes
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Implement logout functionality here
                    print('Logout pressed');
                  },
                  child: const Text("Log out", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, ValueChanged<String> onChanged) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          initialValue: _userData.getFieldValue(labelText),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $labelText';
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ),
    );
  }
}