import 'package:flutter/material.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/widget_nao_validados/foto_contato.dart';

class OrcamentosDetalhes extends StatefulWidget {
  const OrcamentosDetalhes({Key? key}) : super(key: key);

  @override
  State<OrcamentosDetalhes> createState() => _OrcamentosDetalhesState();
}

class _OrcamentosDetalhesState extends State<OrcamentosDetalhes> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Orcamentos orcamentos = receberorcamentos(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(60),
        children: [
          FotoOrcamentos(orcamentos: orcamentos, raio: 600),
          nome(orcamentos),
          telefone(orcamentos),
          email(orcamentos),
          endereco(orcamentos),
          servico(orcamentos)
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Orcamentos receberorcamentos(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null) {
      Orcamentos orcamentos = parametro.settings.arguments as Orcamentos;
      return orcamentos;
    } else {
      throw Exception('Problemas em receber o orcamentos');
    }
  }

  Widget nome(Orcamentos orcamentos) {
    return Center(
        child: Text(orcamentos.nome, style: const TextStyle(fontSize: 30)));
  }

  Widget telefone(Orcamentos orcamentos) {
    return Card(
      child: ListTile(
        title: const Text('Telefone:'),
        subtitle: Text(orcamentos.telefone),
        trailing: painelTelefone(orcamentos),
      ),
    );
  }
  Widget endereco(Orcamentos orcamentos) {
    final cidade = orcamentos.cidade.nome;
    final estado = orcamentos.cidade.estado.sigla;
    return Card(
      child: ListTile(
        title: const Text('Endereço'),
        subtitle: Text("${orcamentos.endereco}, ${cidade} ($estado)"),
      ),
    );
  }


  Widget email(Orcamentos orcamentos) {
    return Card(
      child: ListTile(
        title: const Text('E-mail:'),
        onTap: () {
          launchUrl(Uri(scheme: 'mailto', path: orcamentos.email));
        },
        subtitle: Text(orcamentos.email),
      ),
    );
  }
  

  Widget servico(Orcamentos orcamentos){
    return Card(
      child: ListTile(
        title: const Text('Serviço'),
        subtitle: Text(orcamentos.servico),
      ),
    );
  }




  Widget painelTelefone(Orcamentos orcamentos) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                launchUrl(Uri(scheme: 'sms', path: orcamentos.telefone));
              },
              icon: const Icon(Icons.message)),
          IconButton(
              onPressed: () {
                launchUrl(Uri(scheme: 'tel', path: orcamentos.telefone));
              },
              icon: const Icon(Icons.phone))
        ],
      ),
    );
  }

  Widget botaoVoltar(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
