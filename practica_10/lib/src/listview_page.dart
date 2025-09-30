import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  final List<String> _clasesPokemon = [
    'Normal', 'Lucha', 'Volador', 'Veneno', 'Tierra', 'Roca', 'Insecto',
    'Fantasma', 'Acero', 'Fuego', 'Agua', 'Planta', 'Electrico', 'Psiquico',
    'Hielo', 'Dragon', 'Siniestro', 'Hada', 'Desconocido', 'Sombra'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Práctica 10 - Pokédex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: _clasesPokemon.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset('assets/pokebola.png', width: 50, height: 50),
              title: Text(_clasesPokemon[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
























































































































































































































