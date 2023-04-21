import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                const TextField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari materi',
                    fillColor: Colors.white12,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 20,
                    horizontal: 30
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('List materi', style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < subjects.length; i++)
                                Column(
                                  children: [
                                    InkWell(
                                      onTap:()=>{
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context)=> subjects[i].link
                                          )
                                        )
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          border: Border.all(color: Colors.white, width: 1),
                                          borderRadius: const BorderRadius.all(Radius.circular(20))
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(subjects[i].week, style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                            ),),
                                            const SizedBox(height: 10,),
                                            Text(subjects[i].title, style: const TextStyle(
                                              color: Colors.white
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25,)
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          )
        ),
      ),
    );
  }
}