import 'package:flutter/material.dart';

class MingguSepuluhProvider extends ChangeNotifier{
  final List _ringtones = [
    "None",
    "Callisto",
    "Ganymede",
    "Luna",
    "Oberon",
    "Phobos",
    "Birdy",
    "Rush"
  ];
  String _choosenRingtone = "";
  String _savedRingtone = "Luna";

  List get ringtones => _ringtones;
  String get choosenRingtone => _choosenRingtone;
  String get savedRingtone => _savedRingtone;

  set setInitial(val){
    _choosenRingtone = savedRingtone;
    notifyListeners();
  }

  set setTemp(val){
    _choosenRingtone = val;
    notifyListeners();
  }

  set setSaved(val){
    _savedRingtone=val;
    notifyListeners();
  }
}