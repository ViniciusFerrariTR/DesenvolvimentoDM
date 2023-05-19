import 'package:flutter/material.dart';
import 'package:projeto_um/telas/login.dart';

class EsqueciSenha extends StatelessWidget {
  const EsqueciSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 238, 255, 1),
        title: const Text('Esqueci minha senha',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
          
              const SizedBox(height: 16),
              ElevatedButton(
                  child: const Text("Enviar"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Código enviado com sucesso!")));
          
                  }),
            ],
          ),
        ));

  }
}

