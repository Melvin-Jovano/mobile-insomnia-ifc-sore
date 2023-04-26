import 'package:flutter/material.dart';

class MingguEmpatProvider extends ChangeNotifier{
  final List <Map <String, String>> _listProduk = [];

  List get listProduk => _listProduk;

  void addProduk(val){
    _listProduk.add(val);
    notifyListeners();
  }
}