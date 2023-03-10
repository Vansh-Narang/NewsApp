import 'package:flutter/material.dart';
import 'package:news_app/Ui/MyHomePage.dart';
import 'package:news_app/Ui/Searchbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: Color.fromARGB(255, 247, 165, 0)),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
