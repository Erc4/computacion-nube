import 'package:flutter/material.dart';
import 'package:practica_02/src/page1.dart';
import 'package:practica_02/src/page2.dart';
import 'package:practica_02/src/page3.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 02',
      initialRoute: '/page1',
      routes:{
        '/page1': (context) =>  Page1(),
        '/page2': (context) =>  Page2(),
        '/page3': (context) =>  Page3(),
      }
    );
  }
}