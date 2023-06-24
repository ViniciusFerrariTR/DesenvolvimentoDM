import 'package:flutter/material.dart';
import 'package:projeto_um/database/sqlite/dao/orcamentos_dao_sqlite.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/widget/Botao.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoCidade.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEmail.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEndereco.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoServico.dart';
import '../interface/orcamentos_interface_dao.dart';
import '../widget/widget_nao_validados/CampoNome.dart';
import '../widget/widget_nao_validados/CampoTelefone.dart';
import '../widget/widget_nao_validados/CampoURL.dart';

class OrcamentosForm extends StatefulWidget {
  const OrcamentosForm({Key? key}) : super(key: key);

  @override
  State<OrcamentosForm> createState() => _OrcamentosFormState();
}

class _OrcamentosFormState extends State<OrcamentosForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoServico = CampoServico(controle: TextEditingController());
  final campoEndereco = CampoEndereco(controle: TextEditingController());
  final campoCidade = CampoOpcoesCidade();
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoURL = CampoURL(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Orçamentos')),
        body: 
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                campoNome,
                campoServico,
                campoEndereco,
                campoCidade,
                campoTelefone,
                campoEmail,
                campoURL,
                SizedBox(height:  20,),
                criarBotao(context),
              ],
            )
         ),
    ),
      );
  }


 
  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var orcamentos = preencherDTO();
          OrcamentosInterfaceDAO dao = OrcamentosDAOSQlite();
          dao.salvar(orcamentos);
          Navigator.pop(context);
        }
      },
    );
  }

  Orcamentos preencherDTO() {
    return Orcamentos(
        id: id,
        nome: campoNome.controle.text,
        servico: campoServico.controle.text,
        endereco: campoEndereco.controle.text,
        cidade: campoCidade.opcaoSelecionado?.nome,
        telefone: campoTelefone.controle.text,
        email: campoEmail.controle.text,
        url_avatar: campoURL.controle.text);
  }

  void preencherCampos(Orcamentos orcamentos) {
    campoNome.controle.text = orcamentos.nome;
    campoServico.controle.text = orcamentos.servico;
    campoEndereco.controle.text = orcamentos.endereco;
    campoTelefone.controle.text = orcamentos.telefone;
    campoEmail.controle.text = orcamentos.email;
    campoURL.controle.text = orcamentos.url_avatar;
  }
}
