import 'package:flutter/material.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEmail.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEndereco.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoSenha.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoTelefone.dart';
import '../database/sqlite/dao/Usuario_dao_sqlite.dart';
import '../dto/Usuario.dart';
import '../widget/widget_nao_validados/CampoNome.dart';

class UsuarioForm extends StatefulWidget {
  const UsuarioForm({Key? key}) : super(key: key);

  @override
  State<UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoEndereco = CampoEndereco(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoSenha = CampoSenha(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberDadosParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              campoNome,
              SizedBox(height: 20),
              campoEndereco,
              SizedBox(height: 20),
              campoTelefone,
              SizedBox(height: 20),
              campoEmail,
              SizedBox(height: 20),
              campoSenha,
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      var formState = formKey.currentState;
                      if (formState != null && formState.validate()) {
                        var usuario = preencherDTO();
                        UsuarioDAOSQLite dao = UsuarioDAOSQLite();
                        dao.salvar(usuario);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      "Cadastrar-se",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void receberDadosParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Usuario usuario = parametro.settings.arguments as Usuario;
      id = usuario.id;
      preencherCampos(usuario);
    }
  }

  Usuario preencherDTO() {
    return Usuario(
      id: id,
      usuario: campoNome.controle.text,
      endereco: campoEndereco.controle.text,
      telefone: campoTelefone.controle.text,
      email: campoEmail.controle.text,
      senha: campoSenha.controle.text,
    );
  }

  void preencherCampos(Usuario usuario) {
    campoNome.controle.text = usuario.usuario;
    campoEndereco.controle.text = usuario.endereco;
    campoTelefone.controle.text = usuario.telefone;
    campoEmail.controle.text = usuario.email;
    campoSenha.controle.text = usuario.senha;
  }
}
