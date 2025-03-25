import 'package:flutter/material.dart';

// 하단 탭바를 관리하기 위한 상태 클래스
class AppState extends ChangeNotifier {
  bool _showBottomTab = true;

  bool get showBottomTab => _showBottomTab;

  void setBottomTabVisibility(bool show) {
    if (_showBottomTab != show) {
      _showBottomTab = show;
      notifyListeners();
    }
  }
}
