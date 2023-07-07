import 'package:flutter/material.dart';

import '../widget/widget_nao_validados/validacao_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final dbHelper = DatabaseHelper();
    final users = await dbHelper.getUsers();

    final username = _usernameController.text;
    final password = _passwordController.text;

    bool isValidUser = false;

    for (final user in users) {
      if (user['username'] == username && user['password'] == password) {
        isValidUser = true;
        break;
      }
    }

    if (isValidUser) {
      return;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de autenticação'),
            content: Text('Usuário ou senha inválidos.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuário'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o usuário';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(

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
                        Navigator.pushNamed(
                            context, "orcamentosLista");
                      },
                    ),
                    ElevatedButton(
                      child: Text("Esqueci minha senha"),
                      onPressed: () {
                        Navigator.pushNamed(context, "esqueciSenha");
                      },
                    ),
                    ElevatedButton(
                      child: Text("Cadastro Cidade"),
                      onPressed: () {
                        Navigator.pushNamed(context, "cidadeLista");
                      },
                    ),
                    ElevatedButton(
                      child: Text("Cadastro Estado"),
                      onPressed: () {
                        Navigator.pushNamed(context, "estadoForm");
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
