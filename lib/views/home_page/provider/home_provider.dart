import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isAndroid = true;

  void plathformChange() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
