import 'package:flutter/material.dart';
import 'package:insomnia/pages/minggu4provider.dart';
import 'package:provider/provider.dart';

class MingguEmpatList extends StatefulWidget {
  const MingguEmpatList({super.key});

  @override
  State<MingguEmpatList> createState() => _MingguEmpatListState();
}

class _MingguEmpatListState extends State<MingguEmpatList> {
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<MingguEmpatProvider>(context);
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
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text(
                    "List Produk",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 15, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: provide.listProduk.isNotEmpty
                      ? provide.listProduk.map((e) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.white24
                                        )
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 10, top: 5),
                                          child: Text(
                                            "${e['produk']}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "${e['description']}",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(color: Colors.white70),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        right: 15, 
                                        left: 10, 
                                        top: 5
                                      ),
                                      child: const Text(
                                        "Stok :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${e['stok']}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList()
                      : [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        const Text(
                          "Tidak ada Produk",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 30
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                      ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}