import 'package:flutter/material.dart';
import 'package:insomnia/common/minggu-10/hp.dart';
import 'package:insomnia/common/minggu-10/laptop.dart';
import 'package:insomnia/pages/minggu12detail.dart';

class MingguDuabelas extends StatefulWidget {
  const MingguDuabelas({super.key});

  @override
  State<MingguDuabelas> createState() => _MingguDuabelasState();
}

class _MingguDuabelasState extends State<MingguDuabelas> {
  List<Map<String, dynamic>> data = hp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         PopupMenuButton(
          itemBuilder: (context) {
            return [ 
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    data = hp;
                  });
                },
                child: const ListTile(
                  title: Text('HP'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    data = laptop;
                  });
                },
                child: const ListTile(
                  title: Text('Laptop'),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    data = [];
                  });
                },
                child: const ListTile(
                  title: Text('Clear'),
                ),
              ),
            ];
          },
        )
        ],
        title: const Text('M 12'),
        centerTitle: true,
        backgroundColor: const Color(0xff001f2e),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/wallpaper.png"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            children: [
              Visibility(
                visible: data.isEmpty,
                child: const Column(
                  children: [
                    SizedBox(height: 30,),
                    Icon(Icons.warning, color: Colors.white),
                    SizedBox(height: 10,),
                    Text('Data tak ditemukan',
                     style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
              Visibility(
                visible: data.isNotEmpty,
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(data.length,
                      (index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MingguDuabelasDetail(
                                  data: data[index],
                                )),
                              );
                            },
                            title: Text(data[index]['model'], style: const TextStyle(
                              color: Colors.white
                            ),),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star, size: 12, color: Colors.white54),
                                    const SizedBox(width: 2,),                          
                                    Text(data[index]['rating'].toString(), style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54
                                    ),),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text(data[index]['desc'], style: const TextStyle(
                                  color: Colors.white60
                                ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}