import 'package:flutter/material.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key});

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}


class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
int _currentIndex = 0;
final tabs = [
  Center(child: Text("Mapa")),
  Center(child: Text("E-mail")),
  Center(child: Text("Alarma")),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practica 07"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),  
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "E-mail",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "Alarma",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}