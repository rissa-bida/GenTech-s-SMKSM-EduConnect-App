class Announcement {
  final String id;
  final String classId; // To associate with a specific class
  final String title;
  final String description;
  final DateTime date;

  Announcement({
    required this.id,
    required this.classId,
    required this.title,
    required this.description,
    required this.date,
  });
}
