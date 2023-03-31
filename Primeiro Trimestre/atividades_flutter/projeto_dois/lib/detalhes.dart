import 'package:flutter/material.dart';

import 'home.dart';

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        backgroundColor: Color.fromRGBO(200, 120, 0, 0.957),
      ),
      body: ElevatedButton(
        child: const Text('Home'),
        onPressed: () {
          Route rota = MaterialPageRoute(builder: (context) => Home());
          Navigator.pushReplacement(context, rota);
        },
      ),
    );
  }
}
