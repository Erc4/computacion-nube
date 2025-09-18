import 'package:flutter/material.dart';
import 'package:practica_03/src/home_page.dart';

void main() =>  runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Practica 03', home: HomePage());
  }
}