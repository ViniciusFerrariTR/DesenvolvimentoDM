import 'package:flutter/material.dart';
import 'package:projeto_um/login.dart';
import 'home.dart';

class App extends StatelessWidget{


  @override
  Widget build (BuildContext context) {


    return MaterialApp(
      title: 'Tela Um',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
  

}