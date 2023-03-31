import 'package:flutter/material.dart';
import 'package:projeto_dois/home.dart';
import 'cadastro.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromRGBO(5, 87, 142, 0.957),
      ),
      body: ElevatedButton(
          child: const Text('Home'),
          onPressed: () {
            Route rota = MaterialPageRoute(builder: (context) => Home());
            Navigator.pushNamed(context, 'home');
          }),
    );
  }
}
