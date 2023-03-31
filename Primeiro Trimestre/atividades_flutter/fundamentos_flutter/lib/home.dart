import 'package:flutter/material.dart';

/*Nunca definir botao como constante */

class Home extends StatelessWidget{
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira Tela'),

      ),
    );

  }
}