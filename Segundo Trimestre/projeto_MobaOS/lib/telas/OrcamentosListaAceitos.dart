import 'package:flutter/material.dart';
import 'package:projeto_um/database/daofake/dados_fake.dart';
import 'package:projeto_um/database/daofake/orcamentos_dao_fake.dart';
import 'package:projeto_um/database/sqlite/dao/orcamentos_dao_sqlite.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:projeto_um/rotas.dart';
import 'package:projeto_um/widget/BarraNavegacao.dart';
import 'package:projeto_um/widget/BotaoAdicionar.dart';
import 'package:projeto_um/widget/widget_nao_validados/foto_contato.dart';
import 'package:projeto_um/widget/widget_nao_validados/painel_botoes.dart';
import 'package:projeto_um/widget/widget_aceitos/PainelBotoesAceitos.dart';

class OrcamentosListaAceitos extends StatefulWidget {
  const OrcamentosListaAceitos({Key? key}) : super(key: key);

  @override
  State<OrcamentosListaAceitos> createState() => _OrcamentosListaAceitosState();
}

class _OrcamentosListaAceitosState extends State<OrcamentosListaAceitos> {
  OrcamentosInterfaceDAO dao = OrcamentosDAOSQlite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Orcamentos Aceitos')),
        body: criarLista(context),
       
  );}

  Future<List<Orcamentos>> buscarTodosAceitos() {
    setState(() {});
    return dao.consultarTodosAceitos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: dao.consultarTodosAceitos(),
      builder: (context, AsyncSnapshot<List<Orcamentos>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há orçamentos!!!');
        List<Orcamentos> orcamentosAceitos = lista.data!;
        return ListView.builder(
          itemCount: orcamentosAceitos.length,
          itemBuilder: (context, indice) {
            var orcamentos = orcamentosAceitos[indice];
            return criarItemLista(context, orcamentos);
          },
        );
      },
    );
  }

  

  Widget criarItemLista(BuildContext context, Orcamentos orcamentos) {
    return ItemLista(
        orcamentosAceitos: orcamentos,

        detalhes: () {
          Navigator.pushNamed(context, Rotas.orcamentosDetalhes,
              arguments: orcamentos);
        },
        concluirAceitos: () {
          dao.concluirAceitos(orcamentos.id);
          buscarTodosAceitos();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Orcamentos orcamentosAceitos;
  final VoidCallback detalhes;
  final VoidCallback concluirAceitos;

  const ItemLista(
      {required this.orcamentosAceitos,

      required this.detalhes,
      required this.concluirAceitos,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoContato(orcamentos: orcamentosAceitos),
      title: Text(orcamentosAceitos.nome),
      subtitle: Text(orcamentosAceitos.telefone),
      trailing: PainelBotoesAceitos(concluirAceitos: concluirAceitos),
      onTap: detalhes,
    );
  }
}
