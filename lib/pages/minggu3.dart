import 'package:flutter/material.dart';
import 'package:insomnia/common/minggu-3/todos.dart';
import 'package:insomnia/pages/minggu3list.dart';

class MingguTiga extends StatefulWidget {
  const MingguTiga({super.key});
  
  @override
  State<MingguTiga> createState() => _MingguTigaState();
}

class _MingguTigaState extends State<MingguTiga> {
  var kegiatanValue = TextEditingController();
  var keteranganValue = TextEditingController();
  var mulaiValue = TextEditingController();
  var akhirValue = TextEditingController();
  var kategoriValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: const Color(0xff001f2e),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MingguTigaTodos()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Row(
                children: [
                  const Icon(Icons.book, color: Colors.white,),
                  const SizedBox(width: 10,),
                  const Text('Kegiatan: '),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      controller: kegiatanValue,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: 'Judul Kegiatan',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1))
                      ),
                    )
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                children: const [
                  Icon(Icons.list, color: Colors.white),
                  const SizedBox(width: 10,),
                  Text('Keterangan: ')
                ],
              ),
              const SizedBox(height: 20,),
              
              Row(
                children: [
                  const SizedBox(width: 30,),
                  Expanded(
                    child: TextField(
                      controller: keteranganValue,
                      decoration: const InputDecoration(
                        hintText: 'Tambah Keterangan',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        contentPadding: EdgeInsets.all(30)
                      ),
                    )
                  ),
                ],
              ),
              
              const SizedBox(height: 30,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.calendar_month, color: Colors.white),
                  const SizedBox(width: 10,),
                  Text('Tanggal Mulai'),
                  SizedBox(width: 40,),
                  Icon(Icons.calendar_month, color: Colors.white),
                  const SizedBox(width: 10,),
                  Text('Tanggal Selesai'),
                ],
              ),

              Row(
                children: [
                  const SizedBox(width: 50,),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: mulaiValue,
                      decoration: const InputDecoration(
                        hintText: '20-03-2022',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1))
                      ),
                    ),
                  ),
                  const SizedBox(width: 50, height: 80,),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: akhirValue,
                      decoration: const InputDecoration(
                        hintText: '20-03-2022',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1))
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  const SizedBox(width: 10,),
                  const Icon(Icons.category, color: Colors.white),
                  const SizedBox(width: 10,),
                  const Text('Kategori'),
                  const SizedBox(width: 10,),
                  SizedBox(width: 200, 
                  child: TextField(
                    controller: kategoriValue,
                      decoration: const InputDecoration(
                        hintText: 'Tambah Keterangan',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1))
                      ),
                  ),)
                  
                ],
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todos.add({
                      'kegiatan': kegiatanValue.text,
                      'keterangan': keteranganValue.text,
                      'mulai': mulaiValue.text,
                      'akhir': akhirValue.text,
                      'kategori': kategoriValue.text
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff001f2e),
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0)
                ),
                child: const Text('Simpan', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
