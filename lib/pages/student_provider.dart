import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  String _studentId = '';

  String get studentId => _studentId;

  set studentId(String id) {
    _studentId = id;
    notifyListeners();
  }
}
