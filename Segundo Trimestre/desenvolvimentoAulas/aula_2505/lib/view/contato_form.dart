import 'package:flutter/material.dart';
import 'package:aula_2505/database/daofake/contato_dao_fake.dart';
import 'package:aula_2505/view/dto/contato.dart';
import 'package:aula_2505/view/interface/contato_interface_dao.dart';
import 'package:aula_2505/view/widget/botao.dart';
import 'package:aula_2505/view/widget/campo_email.dart';
import 'package:aula_2505/view/widget/campo_nome.dart';
import 'package:aula_2505/view/widget/campo_telefone.dart';
import 'package:aula_2505/view/widget/campo_url.dart';

import '../database/sqlite/dao/contato_dao_sqlite.dart';

class ContatoForm extends StatefulWidget {
  const ContatoForm({Key? key}) : super(key: key);

  @override
  State<ContatoForm> createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context) {
    receberContatoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoNome,
                campoTelefone,
                campoEmail,
                campoURL,
                criarBotao(context),
              ],
            )));
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoURL = CampoURL(controle: TextEditingController());

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var contato = preencherDTO();
          ContatoInterfaceDAO dao = ContatoDAOSQLite();
          dao.salvar(contato);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberContatoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Contato contato = parametro.settings.arguments as Contato;
      id = contato.id;
      preencherCampos(contato);
    }
  }

  Contato preencherDTO() {
    return Contato(
        id: id,
        nome: campoNome.controle.text,
        email: campoEmail.controle.text,
        telefone: campoTelefone.controle.text,
        urlAvatar: campoURL.controle.text);
  }

  void preencherCampos(Contato contato) {
    campoNome.controle.text = contato.nome;
    campoEmail.controle.text = contato.email;
    campoTelefone.controle.text = contato.telefone;
    campoURL.controle.text = contato.urlAvatar;
  }
}
