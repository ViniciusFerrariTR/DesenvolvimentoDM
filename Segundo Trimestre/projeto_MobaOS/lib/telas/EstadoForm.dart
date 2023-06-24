import 'package:flutter/material.dart';

import '../database/sqlite/dao/estado_dao_sqlite.dart';
import '../dto/Estado.dart';
import '../interface/estado_interface_dao.dart';
import '../widget/Botao.dart';
import '../widget/widget_nao_validados/CampoNome.dart';

class EstadoForm extends StatefulWidget {
  const EstadoForm({Key? key}) : super(key: key);

  @override
  State<EstadoForm> createState() => _EstadoFormState();
}

class _EstadoFormState extends State<EstadoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoSigla = CampoNome(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberEstadoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoNome,
                campoSigla,
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
          var estado = preencherDTO();
          EstadoInterfaceDAO dao = EstadoDAOSQLite();
          dao.salvar(estado);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberEstadoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Estado estado = parametro.settings.arguments as Estado;
      id = estado.id;
      preencherCampos(estado);
    }
  }

  Estado preencherDTO() {
    return Estado(
      id: id,
      nome: campoNome.controle.text,
      sigla: campoSigla.controle.text,
    );
  }

  void preencherCampos(Estado estado) {
    campoNome.controle.text = estado.nome;
    campoSigla.controle.text = estado.sigla;
  }
}
