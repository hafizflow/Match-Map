import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:match_map_apk/utility/demo_lists.dart';

class SettingProvider extends ChangeNotifier {
  String sports = DemoLists.sportName[0];
  String location = DemoLists.locationName[0];

  // sports
  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // locations
  int selectedLocation = 0;
  void setSelectedLocation(int index) {
    selectedLocation = index;
    notifyListeners();
  }

  // slider
  double sliderValue = 5;
  void setSliderValue(double value) {
    sliderValue = value;
    notifyListeners();
  }

  TextEditingController textField1 = TextEditingController();
  TextEditingController textField2 = TextEditingController();
  TextEditingController textField3 = TextEditingController();

  setTextField1(String? value) {
    textField1.text = value ?? '';
  }

  setTextField2(String? value) {
    textField2.text = value ?? '';
  }

  setTextField3(String? value) {
    textField3.text = value ?? '';
  }

  // add task
  addData() {
    final itemData = {
      'sports': sports,
      'textField1': textField1.text,
      'textField2': textField2.text,
      'textField3': textField3.text,
      'location': location,
      'distance': sliderValue.toString(),
    };

    CollectionReference collection =
        FirebaseFirestore.instance.collection('client');

    // adding to firestore
    collection.add(itemData);

    // log(textField1.text);
    // log(textField2.text);
    // log(textField3.text);
    // log(sports);
    // log(sliderValue.toString());
    // log(location);

    notifyListeners();
  }
}
