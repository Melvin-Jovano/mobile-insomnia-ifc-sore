import 'package:flutter/material.dart';
import 'package:insomnia/pages/minggu7provider.dart';
import 'package:provider/provider.dart';

class MingguTujuhBody extends StatefulWidget {
  const MingguTujuhBody({super.key});

  @override
  State<MingguTujuhBody> createState() => _MingguTujuhBodyState();
}

class _MingguTujuhBodyState extends State<MingguTujuhBody> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MingguTujuhProvider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/wallpaper.png"),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10)
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: prov.listHewan.map((e) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          e['gambar']
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Text(
                    e['nama'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              )
            );
          },).toList(),
        )
      ),
    );
  }
}