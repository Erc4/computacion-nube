import 'package:flutter/material.dart';
import 'package:practica_06/src/main_drawer.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 08'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.white,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}