import 'package:flutter/material.dart';
import 'package:projeto_um/database/daofake/dados_fake.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/widget/Botao.dart';
import 'package:projeto_um/widget/CampoEndereco.dart';
import 'package:projeto_um/widget/CampoServico.dart';
import 'package:projeto_um/widget/CampoURL.dart';
import '../database/daofake/orcamentos_dao_fake.dart';
import '../interface/orcamentos_interface_dao.dart';
import '../widget/CampoNome.dart';
import '../widget/CampoTelefone.dart';
import '../widget/CampoURL.dart';

class OrcamentosDetalhes extends StatefulWidget {
  const OrcamentosDetalhes({Key? key}) : super(key: key);

  @override
  State<OrcamentosDetalhes> createState() => _OrcamentosDetalhesState();
}

class _OrcamentosDetalhesState extends State<OrcamentosDetalhes> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Orcamentos? orcamentos = receberContato(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: 
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey, // Cor de fundo do campo
          ),
          child: ClipOval(
            child: Image.network(
              orcamentos!.urlAvatar, fit: BoxFit.cover,
            ),
          ),
        )
    );
  }

  Orcamentos? receberContato(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Orcamentos orcamentos = parametro.settings.arguments as Orcamentos;
      return orcamentos;
    } else {
      return null;
    }
  }
}