import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isAndroid = true;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  double sliderIndex = 0;
  String? selectedSegment;
  String? selectedSlidingSegment;

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

  void changeSliderIndex(double inx) {
    sliderIndex = inx;
    notifyListeners();
  }

  void segmentIndex(String value) {
    selectedSegment = value;
    notifyListeners();
  }

  void SlidingControllerInx(String value) {
    selectedSlidingSegment = value;
    notifyListeners();
  }
}
