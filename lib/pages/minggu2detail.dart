import 'package:flutter/material.dart';

class MingguDuaDetail extends StatefulWidget {
  const MingguDuaDetail({super.key, required this.data});
  final Map data;

  @override
  State<MingguDuaDetail> createState() => _MingguDuaDetailState();
}

class _MingguDuaDetailState extends State<MingguDuaDetail> {
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
                    backgroundColor: Colors.black26,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "${widget.data['title']}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
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
                      Image.network(
                        "${widget.data['img']}",
                        fit: BoxFit.cover,
                      ),

                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),

                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Rating :",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),

                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "170 Reviews",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),

                      Text(
                        "${widget.data['desc']}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
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