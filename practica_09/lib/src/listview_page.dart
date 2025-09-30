import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  const ListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 09 - Pokédex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Normal'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Lucha'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Volador'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Veneno'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Tierra'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Roca'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Insecto'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Fantasma'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Acero'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Fuego'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Agua'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Planta'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Electrico'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Psiquico'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Hielo'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Dragon'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Siniestro'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Hada'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Desconocido'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top:5, left: 10, right: 10, bottom: 0.0),
            title: Text('Sombra'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://image.flaticon.com/icons/png/512/188/188918.png'),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap:() {},
          )
        ],
      ),
    );
  }
}