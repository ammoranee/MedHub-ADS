import 'package:flutter/material.dart';
import 'Tampilan Awal/splash_screen.dart';

void main() {
  runApp(MedHub ());
}

class MedHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}