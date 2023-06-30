import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';
import 'package:insomnia/pages/minggu10provider.dart';
import 'package:provider/provider.dart';

class MingguSepuluh extends StatefulWidget {
  const MingguSepuluh({super.key});

  @override
  State<MingguSepuluh> createState() => _MingguSepuluhState();
}

class _MingguSepuluhState extends State<MingguSepuluh> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MingguSepuluhProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff001f2e),
          title: Text(subjects[8].week),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "${subjects[8].week}\n${subjects[8].title}",
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
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () {
                      prov.setInitial = prov.choosenRingtone;
                      showDialog(
                        context: context, 
                        builder: (context) => showAlertDialog(context));
                    },
                    tileColor: Colors.black12,
                    title: const Text(
                      "Ringtones",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      ),
                    ),
                    subtitle: Text(
                      prov.savedRingtone,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context){
    final prov = Provider.of<MingguSepuluhProvider>(context);
    return AlertDialog(
      backgroundColor: Colors.black54,
      insetPadding: const EdgeInsets.symmetric(vertical: 150, horizontal: 50),
      title: const Text(
        "Phone Ringtone",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: List.generate(
            prov.ringtones.length, 
            (index) {
              var ring = prov.ringtones;
              return RadioListTile(
                value: ring[index], 
                groupValue: prov.choosenRingtone, 
                onChanged: (val){
                  prov.setTemp = val;
                },
                title: Text(
                  ring[index],
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              );
            }
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 18
            ),
          )
        ),
        TextButton(
          onPressed: (){
            ScaffoldMessenger.of(context)
            ..removeCurrentMaterialBanner()
            ..showMaterialBanner(showBanner(context));
            Navigator.pop(context);
          }, 
          child: const Text(
            "Confirm",
            style: TextStyle(
              fontSize: 18
            ),
          )
        ),
      ],
    );
  }

  showBanner(BuildContext global){
    final prov = Provider.of<MingguSepuluhProvider>(context, listen: false);
    return MaterialBanner(
      content: Text(
        "Update ringtone to ${prov.choosenRingtone} ?",
        style: const TextStyle(
          fontSize: 20
        ),
      ), 
      actions: [
        TextButton(
          onPressed: (){
            prov.setSaved = prov.choosenRingtone;
            ScaffoldMessenger.of(context).showSnackBar(showSnackBar(global));
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          }, 
          child: const Text("Update")
        ),
        TextButton(
          onPressed: (){
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          }, 
          child: const Text("Dismiss")
        )
      ],
      leading: const Icon(
        Icons.music_note,
      ),
    );
  }

  showSnackBar(BuildContext global){
    final prov = Provider.of<MingguSepuluhProvider>(context, listen: false);
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: Text(
        "Ringtone ${prov.choosenRingtone} has been applied !"
      ),
      action: SnackBarAction(
        label: "Dismiss",
        textColor: Colors.white,
        onPressed: ()=> ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    );
  }
}