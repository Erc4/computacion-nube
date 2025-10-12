import 'package:flutter/material.dart';
import 'package:practica_12/src/view_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '´Practica 10',
      home : ViewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
} 