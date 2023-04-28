import 'package:flutter/material.dart';

class MingguTujuhProvider extends ChangeNotifier{
  int currentIdx = 0;
  List label = [
    "Anjing",
    "Kucing"
  ];

  final List _listAnjing = [
    {
      "nama" : "Alaskan Malamute",
      "gambar" : "assets/img/AlaskanMalamute.jpg"
    },
    {
      "nama" : "American Bulldog",
      "gambar" : "assets/img/AmericanBulldog.jpg"
    },
    {
      "nama" : "Samoyed",
      "gambar" : "assets/img/Samoyed.jpg"
    },
    {
      "nama" : "Siberian Husky",
      "gambar" : "assets/img/SiberianHusky.jpg"
    },
    {
      "nama" : "Doberman",
      "gambar" : "assets/img/Doberman.jpg"
    },
    {
      "nama" : "Golden Retriever",
      "gambar" : "assets/img/GoldenRetriever.jpg"
    },
    {
      "nama" : "Shiba Inu",
      "gambar" : "assets/img/ShibaInu.jpg"
    },
  ];

  final List _listKucing = [
    {
      "nama" : "American Shorthair",
      "gambar" : "assets/img/AmericanShorthair.jpg"
    },
    {
      "nama" : "Persian",
      "gambar" : "assets/img/Persian.jpg"
    },
    {
      "nama" : "Bengal",
      "gambar" : "assets/img/Bengal.jpg"
    },
    {
      "nama" : "British Shorthair",
      "gambar" : "assets/img/BritishShorthair.jpg"
    },
    {
      "nama" : "Ragdoll",
      "gambar" : "assets/img/Ragdoll.jpg"
    },
    {
      "nama" : "Sphynx",
      "gambar" : "assets/img/Sphynx.jpg"
    },
    {
      "nama" : "Maine Coon",
      "gambar" : "assets/img/MaineCoon.jpg"
    },
  ];

  late List _hewan = _listAnjing;

  List get listHewan => _hewan;
  List get listAnjing => _listAnjing;
  List get listKucing => _listKucing;

  set setIdx(val){
    currentIdx = val;
    if(val == 0){
      _hewan = _listAnjing;
    }
    else if(val == 1){
      _hewan = _listKucing;
    }
    notifyListeners();
  }

  set searchHewan(val){
    _hewan = val;
    notifyListeners();
  }
}