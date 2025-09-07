import 'package:flutter/material.dart';
import '../../utils/colors_app.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int contador=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Practica 1')),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child:  Center(child: Text('Contador $contador',style: TextStyle(fontSize: 25, fontFamily: 'MotionPicture',color:ColorsApp.txtColor)
        ,)
        ,)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            contador++;
            print(contador);
            setState(() {
              // Actualizar el contador hace que se vuelva a ejecutar el metodo get o reconstruya el DOM
              
            });
          },
        ),
      ),
    );
  }

  mievento() {
    // TODO: Implement event handler
  }
}
