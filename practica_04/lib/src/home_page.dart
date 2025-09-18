import 'package:flutter/material.dart';
import 'package:practica_04/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomesPageState createState() => _HomesPageState();
}

class _HomesPageState extends State<HomePage> {
  final ctrlnom = new TextEditingController();
  final data = Data(nombre: '', genero: '');
  int _valor = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        title: const Text('Practica 03'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlnom,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: [
                DropdownMenuItem(child: Text('Femenino'), value: 1),
                DropdownMenuItem(child: Text('Masculino'), value: 2),
              ],
              onChanged: (value) {
                setState(() {
                  _valor = value!;
                });
              }),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent[400], foregroundColor: Colors.white ),
              child: Text('Enviar'),
              onPressed: (){
                setState(() {
                  data.nombre = ctrlnom.text;
                  if (_valor == 1) {
                    data.genero = 'Femenino';
                  } else {
                    data.genero = 'Masculino';
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DatosPage(data: data)));
                });
              }),
          ],
        ),
      ),
    );
  }
}

class Data {
  String nombre;
  String genero;

  Data ({this.nombre = '', this.genero = ''});
}

