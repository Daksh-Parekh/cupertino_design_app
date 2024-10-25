import 'package:flutter/material.dart';

class BootomProvider with ChangeNotifier {
  int selectInx = 0;
  void changeInx(int inx) {
    selectInx = inx;
    notifyListeners();
  }
}
