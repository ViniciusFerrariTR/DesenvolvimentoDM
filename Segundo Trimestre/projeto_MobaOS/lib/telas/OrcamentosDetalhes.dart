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
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(orcamentos.urlAvatar),
            ),
            SizedBox(height: 16.0),
            Text(
              nome,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              servico,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

 /* Orcamentos preencherDTO() {
    return Orcamentos(
        id: id,
        nome: campoNome.controle.text,
        servico: campoServico.controle.text,
        endereco: campoEndereco.controle.text,
        telefone: campoTelefone.controle.text,
        urlAvatar: campoURL.controle.text);
  }

  void preencherCampos(Orcamentos orcamentos) {
    campoNome.controle.text = orcamentos.nome;
    campoServico.controle.text = orcamentos.servico;
    campoEndereco.controle.text = orcamentos.endereco;
    campoTelefone.controle.text = orcamentos.telefone;
    campoURL.controle.text = orcamentos.urlAvatar;
  }
}
*/