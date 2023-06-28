import 'package:flutter/material.dart';
import 'package:insomnia/pages/home.dart';
import 'package:insomnia/pages/minggu4provider.dart';
import 'package:insomnia/pages/minggu7provider.dart';
import 'package:insomnia/pages/minggu9provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MingguEmpatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MingguTujuhProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => MingguSembilanProvider()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontFamily: 'Gaegu',
              fontSize: 16
            ),
            titleMedium: TextStyle(
              fontFamily: 'Gaegu',
              fontSize: 20
            ),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white)
          )
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}