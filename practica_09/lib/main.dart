import 'package:flutter/material.dart';
import 'package:practica_09/src/listview_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '´Practica 09',
      home : ListaPage(),
    );
  }
}
