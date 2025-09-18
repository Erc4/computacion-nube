import 'package:flutter/material.dart';
import 'package:practica_04/src/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()))
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 50),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

