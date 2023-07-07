import 'package:flutter/material.dart';
import 'package:insomnia/common/minggu-3/todos.dart';

class MingguTigaTodos extends StatelessWidget {
  const MingguTigaTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
        child: ListView(
          children: [
            for(var todo in todos ) ListTile(
              leading: CircleAvatar(child: Image.network('https://picsum.photos/600/600')),
              title: Text(todo['kegiatan']),
              subtitle: Text(todo['keterangan'], style: const TextStyle(
                color: Colors.white
              ),),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(todo["mulai"], style: const TextStyle(
                    fontSize: 10
                  ),),
                  const Text('s/d', style: TextStyle(
                    fontSize: 10
                  ),),
                  Text(todo["akhir"], style: const TextStyle(
                    fontSize: 10
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}