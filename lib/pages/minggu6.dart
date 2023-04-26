import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';

class MingguEnam extends StatefulWidget {
  const MingguEnam({super.key});

  @override
  State<MingguEnam> createState() => _MingguEnamState();
}

class _MingguEnamState extends State<MingguEnam> {
  bool isON = false;

  String itemSelected = "Putih";

  List listWarna = [
    "Merah",
    "Jingga",
    "Kuning",
    "Hijau",
    "Biru",
    "Ungu",
    "Putih"
  ];

  Map warna = {
    "Merah" : Colors.red,
    "Jingga" : Colors.orange,
    "Kuning" : Colors.yellow,
    "Hijau" : Colors.green,
    "Biru" : Colors.blue,
    "Ungu" : Colors.purple,
    "Putih" : Colors.white
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: FloatingActionButton(
                    onPressed: ()=>{
                      Navigator.pop(context)
                    },
                    backgroundColor: Colors.white12,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "${subjects[5].week}\n${subjects[5].title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: isON == true ? warna[itemSelected] : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black38
                      )
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      isON == true ? "ON" : "OFF",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hidupkan Warna",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Switch(
                            value: isON, 
                            onChanged: (val){
                              setState(() {
                                isON = val;
                              });
                            }
                          )
                        ],
                      ),

                      if(isON == true)...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Pilih Warna",
                               style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),

                            DropdownButton(
                              value: itemSelected,
                              items: listWarna.map((e) {
                                return DropdownMenuItem(
                                  value: e, 
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: warna[e]
                                    ),
                                  )
                                );
                              }).toList(), 
                              onChanged: (val){
                                setState(() {
                                  itemSelected = val as String;
                                });
                              },
                              dropdownColor: Colors.black38,
                            )
                          ],
                        )
                      ]
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}