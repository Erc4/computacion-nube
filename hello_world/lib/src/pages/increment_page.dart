import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _IncrementPageState();
  }
}

class _IncrementPageState extends State<IncrementPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mi primera App en Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Numero de clicks', style: TextStyle(fontSize: 25)),
            Text('$_counter', style: TextStyle(fontSize: 30, color: Colors.red)),
          ],
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
        ],
      ),

    );
  }
}