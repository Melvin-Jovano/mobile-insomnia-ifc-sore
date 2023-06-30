import 'dart:async';

import 'package:flutter/material.dart';

class MingguTigaBelasProvider extends ChangeNotifier{
  double _sliderValue = 0;
  bool _sedangMemanggang = false;
  bool _selesaiMasak = false;

  double get sliderValue => _sliderValue;
  bool get sedangMemanggang => _sedangMemanggang;
  bool get selesaiMasak => _selesaiMasak;

  set setSliderValue(val){
    _sliderValue = val;
    notifyListeners();
  }

  set setSedangMemanggang(val){
    _sedangMemanggang = val;
    notifyListeners();
  }

  set setSelesaiMasak(val){
    _selesaiMasak = val;
    notifyListeners();
  }

  mulaiMemanggang(int val) async{
    setSedangMemanggang = true;
    Future.delayed(Duration(seconds: val), (){
      setSedangMemanggang = false;
      setSelesaiMasak = true;
    });
  }
}