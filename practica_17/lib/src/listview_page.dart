import 'package:flutter/material.dart';
import 'package:practica_17/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = List<Map<String, dynamic>>.from(movies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          final subtitle = item['Genres'] is List
              ? (item['Genres'] as List).join(', ')
              : (item['Genres']?.toString() ?? '');

          return Slidable(
            key: ValueKey(item['title_name'] ?? index.toString()),
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) => onDismissed(index, 'Agregar'),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.library_add,
                  label: 'Agregar',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) => onDismissed(index, 'Eliminar'),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.cancel_outlined,
                  label: 'Eliminar',
                ),
              ],
            ),
            child: ListTile(
              title: Text(item['title_name']?.toString() ?? ''),
              subtitle: Text(subtitle),
            ),
          );
        },
      ),
    );
  }

  void onDismissed(int index, String accion) {
    if (index < 0 || index >= pelis.length) return;
    setState(() {
      pelis.removeAt(index);
    });

    final snackBar = SnackBar(content: Text('Acción: $accion'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}