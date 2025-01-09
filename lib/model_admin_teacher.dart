import 'package:flutter/material.dart';

class Teacher {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String icNumber;
  final String subject;
  final String classAssigned;

  Teacher({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.icNumber,
    required this.subject,
    required this.classAssigned,
  });
}
