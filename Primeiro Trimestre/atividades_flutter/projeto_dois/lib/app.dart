import 'package:flutter/material.dart';
import 'package:projeto_dois/cadastro.dart';
import 'package:projeto_dois/detalhes.dart';
import 'package:projeto_dois/home.dart';
import 'package:projeto_dois/lista.dart';
import 'package:projeto_dois/login.dart';
import 'introducao.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela App',
      //Tema da pagina completa
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/': (context) => Introducao(),
        'login': (context) => Login(),
        'home': (context) => Home(),
        'cadastro': (context) => Cadastro(), 
        'lista': (context) => Lista(), 
        'detalhes': (context) => Detalhes(), 
      },
    );
  }
}
