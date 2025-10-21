import 'package:flutter/material.dart';
import 'package:practica_17/src/listview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListViewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}