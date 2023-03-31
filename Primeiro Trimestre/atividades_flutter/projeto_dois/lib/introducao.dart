import 'package:flutter/material.dart';
import 'package:projeto_dois/home.dart';
import 'package:projeto_dois/login.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introducao'),
        backgroundColor: Color.fromRGBO(16, 106, 92, 0.957),
      ),
            
      body: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            Route rota = MaterialPageRoute(builder: (context) => Login());
            Navigator.pushNamed(context, 'login');
          }),
    );
  }
}
