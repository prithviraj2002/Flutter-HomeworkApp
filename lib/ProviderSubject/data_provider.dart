import 'package:flutter/material.dart';
import 'package:subject_api/Models/subject_class.dart';

class DataProvider extends ChangeNotifier {
  SubjectClass? subjectClass;

  void getSubjectProduct(SubjectClass sc) {
    subjectClass = sc;
    notifyListeners();
  }
}