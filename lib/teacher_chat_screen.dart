import 'package:flutter/material.dart';

class TeacherChatScreen extends StatelessWidget {
  final String studentName;

  const TeacherChatScreen({super.key, required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $studentName'),
        backgroundColor: Colors.red, // Set AppBar color to red
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  message:
                      'Teacher may I set an appointment with you for the assignment consultation?',
                  isSentByMe: false,
                ),
                ChatBubble(
                  message: 'Okay, meet me in the office afternoon tmrw.',
                  isSentByMe: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Define the ChatBubble class as a StatelessWidget
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  // Constructor to initialize the named parameters
  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.red : Colors.red.shade100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
