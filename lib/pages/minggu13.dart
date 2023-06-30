import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';
import 'package:insomnia/pages/minggu13provider.dart';
import 'package:provider/provider.dart';

class MingguTigaBelas extends StatefulWidget {
  const MingguTigaBelas({super.key});

  @override
  State<MingguTigaBelas> createState() => _MingguTigaBelasState();
}

class _MingguTigaBelasState extends State<MingguTigaBelas> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MingguTigaBelasProvider>(context);
    return SafeArea(
      child: Scaffold(
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
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: FloatingActionButton(
                  onPressed: ()=>{
                    Navigator.pop(context)
                  },
                  backgroundColor: Colors.black26,
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "${subjects[11].week}\n${subjects[11].title}",
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
                margin: const EdgeInsets.only(right: 25, left: 25, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text(
                      "Durasi Memanggang : ${prov.sliderValue.round().toString()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),

                    Slider(
                      value: prov.sliderValue, 
                      inactiveColor: Colors.white,
                      min: 0,
                      max: 10,
                      label: prov.sliderValue.round().toString(),
                      onChanged: (value){
                        prov.setSliderValue = value;
                      }
                    ),

                    ElevatedButton(
                      onPressed: (){
                        if(prov.sliderValue.round() == 0){
                          showDialog(
                            context: context, 
                            builder: (context) => showAlertDialog(context));
                        }
                        else{
                          prov.mulaiMemanggang(prov.sliderValue.round());
                        }
                      }, 
                      child: prov.sedangMemanggang == true ? 
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1), 
                          duration: Duration(seconds: prov.sliderValue.round()), 
                          builder: (context, value, _) => CircularProgressIndicator(
                            value: value,
                            color: Colors.deepOrange,
                            backgroundColor: Colors.white,
                          )
                        ),
                      ) : 
                      const Text(
                        "Panggang",
                      )
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: prov.sedangMemanggang == true ?
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1), 
                        duration: Duration(seconds: prov.sliderValue.round()), 
                        builder: (context, value, _) => LinearProgressIndicator(
                          value: value,
                        )
                      ) :
                      prov.selesaiMasak == true ?
                      Tooltip(
                        message: "Ayam Panggang",
                        child: Image.network("https://bit.ly/ayampanggang22",width: 300,),
                      ) :
                      Container(),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      )
    );
  }

  showAlertDialog(BuildContext context){
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 150, horizontal: 50),
      title: const Text(
        "Alert !",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),
      ),
      content: const SizedBox(
        width: double.maxFinite,
        child: Text(
          "Durasi tidak boleh 0 !",
        )
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: const Text(
            "Dismiss",
            style: TextStyle(
              fontSize: 18
            ),
          )
        )
      ],
    );
  }
}