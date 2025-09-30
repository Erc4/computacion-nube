import 'package:flutter/material.dart';
import 'package:practica_10/src/listview_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '´Practica 10',
      home : ListaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
} 