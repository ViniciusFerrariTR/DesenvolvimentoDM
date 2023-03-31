import 'package:flutter/material.dart';
import 'package:projeto_um/tela_perfil.dart';

class TelaLoginUsuario extends StatelessWidget{
  const TelaLoginUsuario({super.key});
  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Usuario'),
          backgroundColor:Color.fromRGBO(119, 134, 5, 0.522),
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
                        MaterialPageRoute(builder: (context) => Perfil()));
                  }),
            ],
          ),
        ));
  }
}
  
