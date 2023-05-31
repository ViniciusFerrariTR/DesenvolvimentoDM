import 'package:flutter/material.dart';
import 'package:projeto_um/telas/EsqueciSenha.dart';
import 'package:projeto_um/telas/LoginPrimario.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          backgroundColor: const Color.fromRGBO(0, 238, 255, 1),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  hintText: "Usuário",
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Endereço",
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Telefone",
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text("Cadastrar"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginPrimario()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Cadastrado com sucesso!!!")));
                  }),
                  
            ],
          ),
        ));
  }
}
