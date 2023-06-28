import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MingguDuabelasDetail extends StatefulWidget {
  dynamic data;

  MingguDuabelasDetail({
    super.key,
    required this.data
  });

  @override
  State<MingguDuabelasDetail> createState() => _MingguDuabelasDetailState();
}

class _MingguDuabelasDetailState extends State<MingguDuabelasDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: [
            Image.network(widget.data['img'], fit: BoxFit.cover, width: double.infinity, height: 250,),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: const Text('Model:', style: TextStyle(
                        color: Colors.white
                      ),)),
                      Expanded(flex: 2,child: Text(widget.data['model'], style: const TextStyle(
                        color: Colors.white
                      ),)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: const Text('Developer:', style: TextStyle(
                        color: Colors.white
                      ),)),
                      Expanded(flex: 2,child: Text(widget.data['developer'], style: const TextStyle(
                        color: Colors.white
                      ),)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: const Text('Price:', style: TextStyle(
                        color: Colors.white
                      ),)),
                      Expanded(flex: 2,child: Text('Rp.${widget.data['price']}', style: const TextStyle(
                        color: Colors.white
                      ),)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: const Text('Rating:', style: TextStyle(
                        color: Colors.white
                      ),)),
                      Expanded(flex: 2,child: Text(widget.data['rating'].toString(), style: const TextStyle(
                        color: Colors.white
                      ),)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: const Text('Description:', style: TextStyle(
                        color: Colors.white
                      ),)),
                      Expanded(flex: 2,child: Text(widget.data['desc'], style: const TextStyle(
                        color: Colors.white
                      ),)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}