import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Login extends StatelessWidget {
  const Login({super.key});

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
                padding: EdgeInsets.all(30),
                child:  Row(
              
                mainAxisAlignment: MainAxisAlignment.center,
                
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
                          context, "apresentacaoUm", (route) => false);
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
                )
      
             
            ],
          ),
        ),
      ),
    );
  }
}
