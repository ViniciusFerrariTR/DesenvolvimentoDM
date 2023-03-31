
// ignore_for_file: prefer_const_constructors  

import 'package:flutter/material.dart';
import 'package:projeto_um/login.dart';
import 'package:projeto_um/tela_admin.dart';

import 'login_admin.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela principal"),
        backgroundColor: Color.fromARGB(255, 226, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Entrar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLoginUsuario()),
                );
              },
            ),

            ElevatedButton(
                  child: Text("Admin"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TelaLoginAdmin()));
                  }
            ),
            ],
        ),
      ),
    );
  }
}