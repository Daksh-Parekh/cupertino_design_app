import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isAndroid = true;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  void plathformChange() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void changeDate(DateTime d1) {
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay t1) {
    time = t1;
    notifyListeners();
  }
}
