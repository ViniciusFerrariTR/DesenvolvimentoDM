import 'package:flutter/material.dart';
import 'package:projeto_dois/lista.dart';

class Cadastro extends StatelessWidget{
  const Cadastro({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Color.fromRGBO(150, 5, 73, 0.957),
      ),
      body: ElevatedButton(
        child: const Text('Lista'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Lista());
          Navigator.pushNamed(context, 'lista');
        },
      ),
    );
  
  }
}