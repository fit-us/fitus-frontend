import 'package:flutter/material.dart';

class RecordContext extends ChangeNotifier {
  int emotion = 0;
  String? selectedMoment;
  List<String> expressions = [];
  RecordContext();

  void setMoment(String moment) {
    selectedMoment = moment;
    notifyListeners();
  }

  void setEmotion(int newEmotion) {
    emotion = newEmotion;
    notifyListeners();
  }

  void setExpressions(List<String> newExpressions) {
    expressions = newExpressions;
    notifyListeners();
  }
}
