import 'package:flutter/material.dart';
import 'package:insomnia/common/subjects.dart';

class MingguSembilan extends StatefulWidget {
  const MingguSembilan({super.key});

  @override
  State<MingguSembilan> createState() => _MingguSembilanState();
}

class _MingguSembilanState extends State<MingguSembilan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              subjects[7].week,
              style: const TextStyle(
                fontFamily: "Gaegu",
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            backgroundColor: const Color(0xff001f2e),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Music",
                    style: TextStyle(
                      fontFamily: "Gaegu",
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Favorite",
                    style: TextStyle(
                      fontFamily: "Gaegu",
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Saved",
                    style: TextStyle(
                      fontFamily: "Gaegu",
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 500,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TabBarView(
                      children: [
                        buttonSheets(context),
                        TextButton(
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "Favorite",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            )
                          ),
                        TextButton(
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "Saved",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            )
                          ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Color(0xff001f2e)),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1331&q=80"
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "John Doe",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text("johndoe@gmail.com",
                              style: TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {},
                  title: const Text("Inbox"),
                  leading: const Icon(Icons.inbox),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  onTap: () => {},
                  title: const Text("Archived"),
                  leading: const Icon(Icons.save),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  onTap: () => {},
                  title: const Text("About Us"),
                  leading: const Icon(Icons.info_outline),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  buttonSheets(BuildContext context) {
    return Builder(builder: ((context) {
      return Center(
        child: TextButton(
          onPressed: () {
            showBottomSheet(
                enableDrag: true,
                context: context,
                builder: ((context) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text(
                          "Social Media",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        tileColor: const Color(0xff001f2e),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () => {},
                        title: const Text("Facebook"),
                      ),
                      ListTile(
                        onTap: () => {},
                        title: const Text("Twitter"),
                      ),
                      ListTile(
                        onTap: () => {},
                        title: const Text("Instagram"),
                      ),
                    ],
                  );
                }));
          },
          child: const Text(
            "Click Me !", 
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          ),
        ),
      );
    }));
  }
}