import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Pagina 2'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.amber),
                onPressed: (){
                  Navigator.pushNamed(context, '/page2');
                }
              ),
              ElevatedButton(
              child: Text('Pagina 3'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red),
              onPressed: (){
                  Navigator.pushNamed(context, '/page3');
              }
              ),
          ],
        ),
      ),
    );
  }
}