

import 'package:flutter/material.dart';
import 'package:projeto_um/widget/widget_aceitos/CampoEmail.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEndereco.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoSenha.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoTelefone.dart';

import '../database/sqlite/dao/Usuario_dao_sqlite.dart';
import '../dto/Usuario.dart';
import '../interface/Usuario_interface_dao.dart';
import '../widget/Botao.dart';
import '../widget/widget_nao_validados/CampoNome.dart';
import '../widget/widget_nao_validados/campo_opcoes_estado.dart';

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
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoNome,
                campoEndereco,
                campoTelefone,
                campoEmail,
                campoSenha,
                criarBotao(context),
              ],
            )));
  }

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var usuario = preencherDTO();
          UsuarioDAOSQLite dao = UsuarioDAOSQLite();
          dao.salvar(usuario);
          Navigator.pop(context);
        }
      },
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
        senha: campoSenha.controle.text);
  }

  void preencherCampos(Usuario usuario) {
    campoNome.controle.text = usuario.usuario;
    campoEndereco.controle.text = usuario.endereco;
    campoTelefone.controle.text = usuario.telefone;
    campoEmail.controle.text = usuario.email;
    campoSenha.controle.text = usuario.senha;
    
  }
}
