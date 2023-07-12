import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'minggu15webview.dart';

class MingguLimaBelas extends StatefulWidget {
  const MingguLimaBelas({super.key});

  @override
  State<MingguLimaBelas> createState() => _MingguLimaBelasState();
}

class _MingguLimaBelasState extends State<MingguLimaBelas> {
  XFile? img;
  List<XFile> imgs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('M 15'),
          backgroundColor: const Color(0xff001f2e),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => {
              Navigator.pop(context)
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: CarouselSlider(
                  items: [
                    for(int i = 1; i < 6; i++)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const MingguLimaBelasWebView(url: 'https://pub.dev/packages/webview_flutter',)
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/$i'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text('Text $i'),
                        ),
                      ),
                    )
                  ], 
                  options: CarouselOptions(), 
                ),
              ),
              if(img != null)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200
                ),
                child: Image.file(File(img!.path))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      final file = await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        img = file;
                      });
                    }, 
                    child: const Text('Gallery')
                  ),
                  TextButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final result = await picker.pickMultiImage();

                      if(context.mounted && result.isEmpty) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Hold on there buster!'),
                            content: const Text('Bro aint pick any images >:('),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ugh fine'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                      setState(() {
                        imgs = result;
                      });
                    }, 
                    child: const Text('Multi Image')
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      final file = await picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        img = file;
                      });
                    }, 
                    child: const Text('Camera')
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 10,
                  children: [
                    for(int i = 0; i < imgs.length; i++)
                    Image.file(File(imgs[i].path),)
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}