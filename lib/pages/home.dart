import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';
import 'package:insomnia/common/utils/format_date.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var subjectsList = subjects;
  int gridView = 1;

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
              horizontal: 15
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
                TextField(
                  onChanged: (val) {
                    setState(() {
                      subjectsList = subjects.where(
                        (i) => i.title.toLowerCase().contains(val.toLowerCase()) || i.week.toLowerCase().contains(val.toLowerCase())
                      ).toList();
                    });
                  },
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Cari minggu / materi',
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
                    vertical: 15,
                    horizontal: 20
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('List materi', style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),),
                          Row(
                            children: [
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      setState(() {
                                        sorting("ascending");
                                      });
                                    },
                                    child: const ListTile(
                                      leading: Icon(Icons.north),
                                      title: Text("Ascending"),
                                    )
                                  ),

                                  PopupMenuItem(
                                    onTap: () {
                                      setState(() {
                                        sorting('descending');
                                      });
                                    },
                                    child: const ListTile(
                                      leading: Icon(Icons.south),
                                      title: Text("Descending"),
                                    )
                                  )
                                ], 
                                icon: const Icon(
                                  Icons.sort,
                                  color: Colors.white,
                                )
                              ),
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: const Text('1 Grid'),
                                    onTap: () {
                                        setState(() {
                                          gridView = 1;
                                        });
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: const Text('2 Grid'),
                                    onTap: () {
                                      setState(() {
                                        gridView = 2;
                                      });
                                    },
                                  ),
                                ],
                                child: const Icon(Icons.grid_view_rounded, color: Colors.white)
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: gridView == 1 
                          ? SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                subjectsList.length, 
                                (i) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if(subjectsList[i].cb != null) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => subjectsList[i].cb!() as Widget
                                              )   
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white24,
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: const BorderRadius.all(Radius.circular(20))
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                            horizontal: 15
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(subjectsList[i].week, style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline,
                                                color: Colors.white
                                              ),),
                                              const SizedBox(height: 10,),
                                              Text(subjectsList[i].title, style: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic
                                              ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5,),
                                              Text(formatDate(date: subjectsList[i].createdAt), style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 25,)
                                    ],
                                  ),
                              ),
                            ),
                          )
                          : GridView.count(
                          primary: false,
                          crossAxisSpacing: 15,
                          padding: EdgeInsets.zero,
                          mainAxisSpacing: 0,
                          crossAxisCount: gridView,
                          children: List.generate(
                            subjectsList.length, 
                            (i) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if(subjectsList[i].cb != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => subjectsList[i].cb!() as Widget
                                          )   
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        border: Border.all(color: Colors.white, width: 1),
                                        borderRadius: const BorderRadius.all(Radius.circular(20))
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 15
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(subjectsList[i].week, style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline,
                                            color: Colors.white
                                          ),),
                                          Visibility(
                                            visible: gridView < 3,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(height: 10,),
                                                Text(subjectsList[i].title, style: const TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic
                                                ),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 5,),
                                                Text(formatDate(date: subjectsList[i].createdAt), style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white
                                                ),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          )
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