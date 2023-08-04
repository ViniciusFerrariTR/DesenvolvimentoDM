import 'package:flutter/material.dart';
import 'package:projeto_um/database/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';
import '../dto/Usuario.dart';

class LoginPrimario extends StatefulWidget {
  const LoginPrimario({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPrimario> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MOBA O.S",
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'NomeDaFonte',
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 50),
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
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "cadastro");
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text("Criar conta"),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
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
                                Usuario usuarioEncontrado =
                                    Usuario.fromMap(maps.first);
                                if (usuarioEncontrado.senha == senhaDigitada) {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      "orcamentosLista", (route) => false);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Senha incorreta.'),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Usuário não encontrado.'),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text("Entrar"),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "esqueciSenha");
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text("Esqueci minha Senha"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
