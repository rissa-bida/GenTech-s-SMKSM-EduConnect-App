class Grade {
  final String studentId;
  final String classId;
  final String subject;
  String grade;
  final String examType;

  Grade({
    required this.studentId,
    required this.classId,
    required this.subject,
    required this.grade,
    required this.examType,
  });
}