import 'package:flutter/material.dart';
import 'package:projeto_um/database/daofake/orcamentos_dao_fake.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:projeto_um/rotas.dart';
import 'package:projeto_um/widget/BarraNavegacao.dart';
import 'package:projeto_um/widget/BotaoAdicionar.dart';
import 'package:projeto_um/widget/foto_contato.dart';
import 'package:projeto_um/widget/painel_botoes.dart';

class OrcamentosLista extends StatefulWidget {
  const OrcamentosLista({Key? key}) : super(key: key);

  @override
  State<OrcamentosLista> createState() => _OrcamentosListaState();
}

class _OrcamentosListaState extends State<OrcamentosLista> {
  OrcamentosInterfaceDAO dao = OrcamentosDAOFake();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Orcamentos')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.orcamentosForm)),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<List<Orcamentos>> buscarContatos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: dao.consultarTodos(),
      builder: (context, AsyncSnapshot<List<Orcamentos>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há orçamentos!!!');
        List<Orcamentos> listaContatos = lista.data!;
        return ListView.builder(
          itemCount: listaContatos.length,
          itemBuilder: (context, indice) {
            var contato = listaContatos[indice];
            return criarItemLista(context, contato);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Orcamentos orcamentos) {
    return ItemLista(
        orcamentos: orcamentos,
        aceitar: () {
          Navigator.pushNamed(context, Rotas.orcamentosForm, arguments: orcamentos)
              .then((value) => buscarContatos());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.orcamentosDetalhes);
        },
        excluir: () {
          dao.excluir(orcamentos.id);
          buscarContatos();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Orcamentos orcamentos;
  final VoidCallback aceitar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.orcamentos,
      required this.aceitar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoContato(orcamentos: orcamentos),
      title: Text(orcamentos.nome),
      subtitle: Text(orcamentos.telefone),
      trailing: PainelBotoes(aceitar: aceitar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
