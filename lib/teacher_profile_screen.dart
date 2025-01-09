import 'package:flutter/material.dart';
import 'teacher_class_configuration_screen.dart';
import 'teacher_edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100, // Light red background
      appBar: AppBar(
        backgroundColor: Colors.red, // Red AppBar
        title: const Text('Teacher Profile'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Add some spacing at the top
          const CircleAvatar(
            radius: 50.0, // Size of the profile picture
            backgroundImage: AssetImage(
                'images/teacher_profile.png'), // Path to the profile image
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Agnes John",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200, // Set a maximum width for the button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/EditProfileScreen',
                    ); // Correct route name
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add horizontal spacing
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  width: 200, // Set a maximum width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassConfigurationScreen(
                            userType: 'teacher',
                            className: 'Class 4A',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Class 4A',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing
                SizedBox(
                  width: 200, // Set a maximum width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassConfigurationScreen(
                            userType: 'teacher',
                            className: 'Class 5A',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Class 5A',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing
                SizedBox(
                  width: 200, // Set a maximum width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassConfigurationScreen(
                            userType: 'teacher',
                            className: 'Class 3C',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Class 3C',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}
