import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insomnia/pages/minggu7body.dart';
import 'package:insomnia/pages/minggu7provider.dart';
import 'package:provider/provider.dart';

class MingguTujuh extends StatefulWidget {
  const MingguTujuh({super.key});

  @override
  State<MingguTujuh> createState() => _MingguTujuhState();
}

class _MingguTujuhState extends State<MingguTujuh> {
  TextEditingController searchController = TextEditingController();

  void changedInput(val){
    final prov = Provider.of<MingguTujuhProvider>(context, listen: false);
    if(prov.currentIdx == 0){
      prov.searchHewan = prov.listAnjing.where(
        (element) => element['nama'].toString().toLowerCase().contains(val.toLowerCase())
      ).toList();
    }
    else if(prov.currentIdx == 1){
      prov.searchHewan = prov.listKucing.where(
        (element) => element['nama'].toString().toLowerCase().contains(val.toLowerCase())
      ).toList();
    }
  }

  _searchDialog(context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: (){
                  changedInput("");
                  searchController.clear();
                },
              ),
              prefixIcon: IconButton(
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                onPressed: () {
                  changedInput(searchController.text);
                  Navigator.pop(context);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onSubmitted: (value) {
              changedInput(value);
              Navigator.pop(context);
            },
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MingguTujuhProvider>(context);
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => {
              changedInput(""),
              Navigator.pop(context)
            },
          ),
          title: Text(
            prov.label[prov.currentIdx],
            style: const TextStyle(
              fontFamily: "Gaegu",
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff001f2e),
        ),
        
        body: const MingguTujuhBody(),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff00243b),
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            searchController.clear();
            prov.setIdx = value;
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.dog),
              label: prov.label[0]
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.cat),
              label: prov.label[1]
            )
          ],
          currentIndex: prov.currentIdx,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _searchDialog(context);
          },
          child: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}