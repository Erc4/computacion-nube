import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  _SliderPageState createState() => _SliderPageState();
}
class _SliderPageState extends State<SliderPage> {
  double valorSlider = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            width: 400.0,
            color: Colors.black54,
            child: Slider(
              value: valorSlider,
              min: 0,
              max: 400,
              label: valorSlider.round().toString(),
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  valorSlider = value;
                });
              },
            )
          ),
            Container(

            width: 400,
            height: 400,
            color: Colors.black54,
            child: Center(
              child: Image(
                image: AssetImage('assets/icon.png'),
                width: valorSlider,
                height: valorSlider,
              ),
            )
          )
        ],
      ),
    );
  }
}