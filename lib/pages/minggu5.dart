import 'package:flutter/material.dart';

class MingguLima extends StatefulWidget {
  const MingguLima({super.key});

  @override
  State<MingguLima> createState() => _MingguLimaState();
}

class _MingguLimaState extends State<MingguLima> {
  bool soal1 = false;
  bool soal2 = false;

  bool pagi = true;
  bool siang = false;

  bool tkj = false;
  bool rpl = false;
  bool sma = false;

  bool sekolah = true;
  bool praktikum = false;
  bool kursus = false;

  String soal3 = 'asd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff001f2e),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {
            Navigator.pop(context)
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/wallpaper.png"),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            const Text(
              '1. Memori yg berfungsi untuk penyimpanan sementara disebut?',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Row(
              children: [
                const Text('a.',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                Checkbox(value: soal1, onChanged: (val) {
                  setState(() {
                    soal1 = val!;
                  });
                }),
                const Text('RAM',
                  style: TextStyle(
                    color: Colors.white
                  ),),
              ],
            ),
            Row(
              children: [
                const Text('b.',
              style: TextStyle(
                color: Colors.white
              ),),
                Checkbox(value: soal2, onChanged: (val) {
                  setState(() {
                    soal2 = val!;
                  });
                }),
                const Text('Random Access Memory',
              style: TextStyle(
                color: Colors.white
              ),),
              ],
            ),
            const SizedBox(height: 20,),
            Visibility(visible: soal1 && soal2,child: const Text('Benar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),),
            Visibility(visible: !soal1 || !soal2, child: const Text('Salah',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),)),
            const SizedBox(height: 20,),

            const Text(
              '2. Skema desain pembangunan jaringan disebut?',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Row(
              children: [
                const Text('a.',
              style: TextStyle(
                color: Colors.white
              ),),
                Radio(value: 'Topologi', onChanged: (val) {
                  setState(() {
                    soal3 = 'Topologi';
                  });
                }, groupValue: soal3,),
                const Text('Topologi',
              style: TextStyle(
                color: Colors.white
              ),),
              ],
            ),
            Row(
              children: [
                const Text('b.',
              style: TextStyle(
                color: Colors.white
              ),),
                Radio(value: 'Desain Jaringan', onChanged: (val) {
                  setState(() {
                    soal3 = 'Desain Jaringan';
                  });
                }, groupValue: soal3,),
                const Text('Desain Jaringan',
              style: TextStyle(
                color: Colors.white
              ),),
              ],
            ),

            const SizedBox(height: 20,),
            Visibility(visible: soal3 == 'Topologi',child: const Text('Benar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),),
            Visibility(visible: soal3 != 'Topologi', child: const Text('Salah',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                  fontSize: 20
              ),)),
            const SizedBox(height: 20,),

            const Text('Feedback Soal',
              style: TextStyle(
                color: Colors.white
              ),),
            const Text('Kelas',
              style: TextStyle(
                color: Colors.white
              ),),

            Row(
              children: [
                ChoiceChip(label:const  Text('Pagi'), selectedColor: Colors.blue, selected: pagi, onSelected: (val) {
                    setState(() {
                      pagi = val;
                    });
                  },),
                const SizedBox(width: 10,),
                ChoiceChip(label: const Text('Siang'), selectedColor: Colors.blue, selected: siang, onSelected: (val) {
                    setState(() {
                      siang = val;
                    });
                  },)
              ],
            ),

            const Text('Soal di atas telah dipelajari saat?',
              style: TextStyle(
                color: Colors.white
              ),),
            Row(
              children: [
                FilterChip(label: const Text('Sekolah'), selectedColor: Colors.blue, selected: sekolah, onSelected: (val) {
                  setState(() {
                    sekolah = val;
                  });
                },),
                const SizedBox(width: 10,),
                FilterChip(label: const Text('Praktikum'), selectedColor: Colors.blue, selected: praktikum, onSelected: (val) {
                  setState(() {
                    praktikum = val;
                  });
                },),
                const SizedBox(width: 10,),
                FilterChip(label: const Text('Kursus'), selectedColor: Colors.blue, selected: kursus, onSelected: (val) {
                  setState(() {
                    kursus = val;
                  });
                },)
              ],
            ),

            const Text('Peminatan sekolah?',
              style: TextStyle(
                color: Colors.white
              ),),

            Row(
              children: [
                Visibility(visible: tkj,child: const ChoiceChip(label: Text('TKJ'), selected: true),),
                const SizedBox(width: 10,),
                Visibility(visible: rpl,child: const ChoiceChip(label: Text('RPL'), selected: true),),
                const SizedBox(width: 10,),
                Visibility(visible: sma,child: const ChoiceChip(label: Text('SMA'), selected: true),)
              ],
            ),

            Row(
              children: [
                InputChip(label: const Text('TKJ',), selectedColor: Colors.blue, selected: tkj, onSelected: (val) {
                  setState(() {
                    tkj = val;
                  });
                },),
                const SizedBox(width: 10,),
                InputChip(label: const Text('RPL'), selectedColor: Colors.blue, selected: rpl, onSelected: (val) {
                  setState(() {
                    rpl = val;
                  });
                },),
                const SizedBox(width: 10,),
                InputChip(label: const Text('SMA'), selectedColor: Colors.blue, selected: sma, onSelected: (val) {
                  setState(() {
                    sma = val;
                  });
                },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
