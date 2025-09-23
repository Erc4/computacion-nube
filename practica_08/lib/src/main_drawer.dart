import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/48169399?v=4'),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 5.0),
              Text('Eric Amezcua', style: TextStyle(fontSize: 22.0),),
              SizedBox(height: 5.0),
              Text('Estudiante',style: TextStyle(fontSize:22.0),),
              SizedBox(height: 20.0,)            ],
          )
          )
        ),
        ListTile(
          leading: Icon(Icons.person,
          color: Colors.black),
          title: Text('Perfil'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.inbox,
          color: Colors.black),
          title: Text('Mensajería'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.assessment,
          color: Colors.black),
          title: Text('Dashboard'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings,
          color: Colors.black),
          title: Text('Config'),
          onTap: () {},
        ),
      ],
    );
  }
}

