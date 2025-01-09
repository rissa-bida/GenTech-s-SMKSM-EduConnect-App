import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for using Navigator.popUntil
import 'model_student_user.dart';
import 'student_editprofile.dart';
import 'home_loginstudent.dart'; // Import Loginstudent

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = UserData.currentUser; // Get the current user data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    userData.profilePicture, // Use the user's profile picture URL
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error); // Show an error icon if the image fails to load
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Profile Information Rows
              _buildProfileInfoRow('Name', userData.name),
              const SizedBox(height: 8),
              _buildProfileInfoRow('Email', userData.email),
              const SizedBox(height: 8),
              _buildProfileInfoRow('Phone', userData.phoneNumber),
              const SizedBox(height: 8),
              _buildProfileInfoRow('Address', userData.address),
              const SizedBox(height: 24),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, '/StudentEditProfile'); // Navigate using named route
                  if (result == true) {
                    // Refresh if needed (e.g., using setState if this was a StatefulWidget)
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 16),

              // Log Out Button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst); // Correct logout
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build profile info rows
  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}