import 'package:flutter/material.dart';

import 'detalhes.dart';

class Lista extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
        backgroundColor: Color.fromRGBO(4, 151, 107, 0.957),
      ),
      body: ElevatedButton(
        child: const Text('Detalhes'),
        onPressed: (){
          Route rota = MaterialPageRoute(builder: (context) => Detalhes());
          Navigator.pushNamed(context, 'detalhes');
        },
      ),
    );
  }
}