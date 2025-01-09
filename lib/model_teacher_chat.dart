class ChatMessage {
  final String senderId; // ID of the user sending the message
  final String receiverId; // ID of the user receiving the message
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });
}
