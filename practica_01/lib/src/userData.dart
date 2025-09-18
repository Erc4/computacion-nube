import 'package:flutter/material.dart';
import 'myAlertDialog.dart';

class datosUsuario extends StatefulWidget{  
  @override
  _datosUsuarioState createState() => _datosUsuarioState();
  }

class _datosUsuarioState extends State<datosUsuario>{
  String _name = '';
  String _phone = '';

  final nameCtrl  = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 01'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Image.asset('assets/images/gato120.jpg'),
          SizedBox(height: 10.0),
          TextField(
            controller: nameCtrl,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: 'Ingresa un nombre'
              ),
          ),
          TextField(
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: "Ingresa un número de célular",
            )
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black),
            child: Text("Enviar"),
            onPressed: (){
              _name = nameCtrl.text;
              _phone = phoneCtrl.text;
              setState(() {
                showAlertDialog(
                  context,
                  'El usuario $_name tiene el teléfono $_phone',
                  'Mi app :)',
                  'OK',
                  'Cancelar');
              });
            })
        ],
      ),
    );
  }
}
