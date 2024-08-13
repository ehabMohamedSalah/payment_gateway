import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{

  int  index=0;

   Future<void> changeIndex(int newIndex) async {
     if(index==newIndex)return;
    index=newIndex;
     notifyListeners();
  }

}
