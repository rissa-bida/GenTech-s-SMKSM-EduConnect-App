class Student {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String classInfo;
  final String icNumber; // New property

  Student({
  required this.id,
  required this.name,
  required this.phoneNumber,
  required this.email,
  required this.classInfo,
  required this.icNumber, // Initialize it
  });
}