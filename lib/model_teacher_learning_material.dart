class LearningMaterial {
  final String id;
  final String classId; // To associate with a specific class
  final String title;
  final String content;

  LearningMaterial({
    required this.id,
    required this.classId,
    required this.title,
    required this.content,
  });
}
