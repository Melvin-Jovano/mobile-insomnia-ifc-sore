import 'package:flutter/material.dart';
import 'package:insomnia/common/minggu-10/hp.dart';
import 'package:insomnia/common/minggu-10/laptop.dart';

class MingguSebelas extends StatefulWidget {
  const MingguSebelas({super.key});

  @override
  State<MingguSebelas> createState() => _MingguSebelasState();
}

class _MingguSebelasState extends State<MingguSebelas> {
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
          // Icon(Icons.menu)
        ],
        title: const Text('M 11'),
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
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
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
                          title: Text(data[index]['model'], style: const TextStyle(
                            color: Colors.white
                          ),),
                          trailing: Text('Rp.${data[index]['price']}', style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                          subtitle: Row(
                            children: [
                              Text(data[index]['developer'], style: const TextStyle(
                                color: Colors.white
                              ),),
                              const SizedBox(width: 10,),
                              const Icon(Icons.star, size: 12, color: Colors.white54),
                              const SizedBox(width: 2,),                          
                              Text(data[index]['rating'].toString(), style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white54
                              ),),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data[index]['img']),
                          ),
                        ),
                      );
                    },
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