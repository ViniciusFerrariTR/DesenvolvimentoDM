import 'package:flutter/material.dart';
import 'package:projeto_um/tela_admin.dart';

class TelaLoginAdmin extends StatelessWidget {
  const TelaLoginAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Admin'),
          backgroundColor: Color.fromRGBO(0, 238, 255, 1),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Usuário",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PerfilAdmin()));
                  }),
            ],
          ),
        ));
  }
}
