import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class SharedPage extends StatefulWidget {
    const SharedPage({super.key});
  
    @override
    _SharedPageState createState() => _SharedPageState();
  }
  
  class _SharedPageState extends State<SharedPage> {
    int _edad = 0;
    String _nombre = "";

    _grabarDatos()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("edad", 23);
      prefs.setString("nombre", 'Eric Amezcua');
    }

    _leerDatos()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _edad = prefs.getInt("edad")!;
        _nombre = prefs.getString("nombre")!;
      });

    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Practica 11 - Shared Preferences '),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            Text('Nombre: $_nombre', style: TextStyle(fontSize: 20),),
            SizedBox( height: 20),
            Text('Edad: $_edad', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _leerDatos();
            });
          },
          tooltip: 'Refrescar',
          child: Icon(Icons.replay_outlined),
          backgroundColor: Colors.teal,
        ),
      );
    }
  }