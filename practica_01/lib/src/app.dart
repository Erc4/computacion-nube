import 'package:flutter/material.dart';
import 'userData.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 01',
      home: Center(
        child: datosUsuario(),
      )
    );
  }
}