import 'package:flutter/material.dart';
import 'package:projeto_um/database/sqlite/dao/orcamentos_dao_sqlite.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:projeto_um/rotas.dart';
import 'package:projeto_um/widget/widget_nao_validados/foto_contato.dart';

import '../widget/widget_nao_validados/botao_concluirAceito.dart';

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


  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: dao.consultar(),
      builder: (context, AsyncSnapshot<List<Orcamentos>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há orçamentos!!!');
        List<Orcamentos> orcamentos = lista.data!;
        return ListView.builder(
          itemCount: orcamentos.length,
          itemBuilder: (context, indice) {
            var orcamentosAceitos = orcamentos[indice];
            return criarItemLista(context, orcamentosAceitos);
          },
        );
      },
    );
  }
  Future<List<Orcamentos>> buscarOrcamentos() {
    setState(() {});
    return dao.consultar();
  }
  

  Widget criarItemLista(BuildContext context, Orcamentos orcamentos) {
    return ItemLista(
        orcamentos: orcamentos,

        detalhes: () {
          Navigator.pushNamed(context, Rotas.orcamentosDetalhes,
              arguments: orcamentos);
        },
        excluir: () {
          setState(() {
            dao.excluir(orcamentos.id);
            buscarOrcamentos();
          });
        });
  }
}

class ItemLista extends StatelessWidget {
  final Orcamentos orcamentos;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.orcamentos,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoOrcamentos(orcamentos: orcamentos),
      title: Text(orcamentos.nome),
      subtitle: Text(orcamentos.telefone),
      trailing: BotaoExcluirAceito(excluir: excluir),
      onTap: detalhes,
    );
  }
}
