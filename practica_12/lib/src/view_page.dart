import 'package:flutter/material.dart';
import 'dart:convert';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 12 - Leer JSON'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: showData == null ? 0 : showData.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(showData[index]['name']['english']),
                  subtitle: Text(showData[index]['type'].toString()),
                );
              } 
            );
          },
        ),
      ),
    );
  }
}

