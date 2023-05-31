import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,      
            children: [           
              Text(
                'MOBA O.S',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 8, 0),
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Usuário",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text("Criar conta"),
                      onPressed: () {
                        Navigator.pushNamed(context, "cadastro");
                      },
                    ),
                    ElevatedButton(
                      child: Text("Entrar"),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "orcamentosLista", (route) => false);
                      },
                    ),
                    ElevatedButton(
                      child: Text("Esqueci minha senha"),
                      onPressed: () {
                        Navigator.pushNamed(context, "esqueciSenha");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
