import 'package:flutter/material.dart';
import 'package:projeto_um/database/sqlite/conexao.dart';
import 'package:projeto_um/widget/widget_nao_validados/validacao_login.dart';
import 'package:sqflite/sqflite.dart';

import '../dto/Usuario.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _usuarioController,
                    decoration: InputDecoration(
                      labelText: "Usuario",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite o Usuario';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite a senha';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text("Criar conta"),
                      onPressed: () {
                        Navigator.pushNamed(context, "cadastro");
                      },
                    ),

                      ElevatedButton(
                        child: Text("Entrar"),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String usuarioDigitado = _usuarioController.text;
                            String senhaDigitada = _senhaController.text;

                            Database db = await Conexao.criar();
                            List<Map<String, dynamic>> maps = await db.query(
                              'usuario',
                              where: 'usuario = ?',
                              whereArgs: [usuarioDigitado],
                            );

                            if (maps.isNotEmpty) {
                              // Se o usuário existir, valide a senha
                              Usuario usuarioEncontrado =
                                  Usuario.fromMap(maps.first);
                              if (usuarioEncontrado.senha == senhaDigitada) {
                                // Login válido, navegue para a página inicial
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "orcamentosLista", (route) => false);
                              } else {
                                // Senha incorreta, exiba uma mensagem de erro
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Senha incorreta.'),
                                  ),
                                );
                              }
                            } else {
                              // Usuário não encontrado, exiba uma mensagem de erro
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Usuário não encontrado.'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                  
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
