import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/practica3/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
       child: Stack(
        alignment: Alignment.topCenter,
       ),
      ),
    );
  }
}