import 'package:flutter/material.dart';
import 'student_chat_personal_screen.dart';
import 'model_student_chat.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Dzawin Nur',
        'lastMessage': 'Rek!',
        'messages': [
          Message(sender: 'Dzawin Nur', text: 'Rek , nanti kita ke gunung lawu!', timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          Message(sender: 'You', text: 'Bawak mi sedap kacang garuda', timestamp: DateTime.now().subtract(const Duration(minutes: 4))),
        ],
      },
      {
        'name': 'Hang Jebat',
        'lastMessage': 'Hei Sedaghee',
        'messages': [
          Message(sender: 'Hang Jebat', text: 'Bagaimanakah khabar sahabt hamba Hang Tuah', timestamp: DateTime.now().subtract(const Duration(hours: 1))),
          Message(sender: 'You', text: 'Hmmm , dia baru sahaja berlaku khianat!', timestamp: DateTime.now().subtract(const Duration(minutes: 55))),
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(chat['name'] as String),
            subtitle: Text(chat['lastMessage'] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    recipientName: chat['name'] as String,
                    messages: chat['messages'] as List<Message>,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}