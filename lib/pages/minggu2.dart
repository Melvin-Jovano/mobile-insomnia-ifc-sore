import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';
import 'package:insomnia/pages/minggu2detail.dart';

class MingguDua extends StatefulWidget {
  const MingguDua({super.key});

  @override
  State<MingguDua> createState() => _MingguDuaState();
}

class _MingguDuaState extends State<MingguDua> {
  Map data = {
    "Mountain" : {
      "title" : "Matterhorn Mountain",
      "img" : "https://www.hostelworld.com/blog/wp-content/uploads/2018/12/matterhorn-1313x875.jpg",
      "desc" : "Matterhorn was first scaled in 1865, with Brit Edward Whymper credited as the initial person to reach the summit. His triumph was bitter sweet, though, since four climbers in Whymper’s seven-strong team plunged to their deaths during their descent."
    },
    "Beach" : {
      "title" : "Pink Beach",
      "img" : "https://www.hostelworld.com/blog/wp-content/uploads/2018/09/PINK-BEACH2.jpg",
      "desc" : "The beach gets it’s soft pink colour due to microscopic animals called Foraminifer attaching themselves to the coral reefs. When the tiny fragments of red coral mixes with white sand, as if by magic, it creates this delicious cotton candy colour."
      
    }
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
                    "${subjects[1].week}\n${subjects[1].title}",
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
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Tap to see Detail",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white
                          ),
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          InkWell(
                            onTap: ()=>{
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => MingguDuaDetail(data: data['Mountain'],) 
                                )
                              )
                            },
                            child:Image.network(
                              "https://www.hostelworld.com/blog/wp-content/uploads/2018/12/matterhorn-1313x875.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                    
                          InkWell(
                            onTap: ()=>{
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) =>MingguDuaDetail(data: data['Beach'],) 
                                )
                              )
                            },
                            child: Image.network(
                              "https://www.hostelworld.com/blog/wp-content/uploads/2018/09/PINK-BEACH2.jpg",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )
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