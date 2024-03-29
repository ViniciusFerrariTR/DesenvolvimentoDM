import 'package:flutter/material.dart';

import '../database/sqlite/dao/cidade_dao_sqlite.dart';
import '../dto/Cidade.dart';
import '../interface/cidade_interface_dao.dart';
import '../widget/Botao.dart';
import '../widget/widget_nao_validados/CampoNome.dart';
import '../widget/widget_nao_validados/campoEstado.dart';

class CidadeForm extends StatefulWidget {
  const CidadeForm({Key? key}) : super(key: key);

  @override
  State<CidadeForm> createState() => _CidadeFormState();
}

class _CidadeFormState extends State<CidadeForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoEstado = CampoOpcoesEstado();

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
                campoEstado,
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
          var cidade = preencherDTO();
          CidadeInterfaceDAO dao = CidadeDAOSQLite();
          dao.salvar(cidade);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberDadosParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Cidade cidade = parametro.settings.arguments as Cidade;
      id = cidade.id;
      preencherCampos(cidade);
    }
  }

  Cidade preencherDTO() {
    return Cidade(
        id: id,
        nome: campoNome.controle.text,
        estado: campoEstado.opcaoSelecionado!);
  }

  void preencherCampos(Cidade cidade) {
    campoNome.controle.text = cidade.nome;
    campoEstado.opcaoSelecionado = cidade.estado;
  }
}
