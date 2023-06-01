import 'package:flutter/material.dart';
import 'package:projeto_um/database/daofake/dados_fake.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/widget/Botao.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoEndereco.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoServico.dart';
import 'package:projeto_um/widget/widget_nao_validados/CampoURL.dart';
import '../database/daofake/orcamentos_dao_fake.dart';
import '../interface/orcamentos_interface_dao.dart';
import '../widget/widget_nao_validados/CampoNome.dart';
import '../widget/widget_nao_validados/CampoTelefone.dart';
import '../widget/widget_nao_validados/CampoURL.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(1.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                // Cor de fundo do campo
              ),
              child: ClipOval(
                child: Image.network(
                  alignment: Alignment.center,
                  orcamentos!.urlAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]),
        ),
      ),
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
