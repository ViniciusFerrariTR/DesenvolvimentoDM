import 'package:flutter/material.dart';
import '../database/sqlite/dao/cidade_dao_sqlite.dart';
import '../dto/Cidade.dart';
import '../interface/cidade_interface_dao.dart';
import '../rotas.dart';
import '../widget/BarraNavegacao.dart';
import '../widget/BotaoAdicionar.dart';
import '../widget/widget_nao_validados/painel_botoes.dart';
import '../widget/widget_nao_validados/painel_botoes_cidade.dart';

class CidadeLista extends StatefulWidget {
  const CidadeLista({Key? key}) : super(key: key);

  @override
  State<CidadeLista> createState() => _CidadeListaState();
}

class _CidadeListaState extends State<CidadeLista> {
  CidadeInterfaceDAO dao = CidadeDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.cidadeForm)
                .then((value) => buscarCidades())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarCidades(),
      builder: (context, AsyncSnapshot<List<Cidade>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há Cidades...');
        List<Cidade> listaCidades = lista.data!;
        return ListView.builder(
          itemCount: listaCidades.length,
          itemBuilder: (context, indice) {
            var cidade = listaCidades[indice];
            return criarItemLista(context, cidade);
          },
        );
      },
    );
  }

  Future<List<Cidade>> buscarCidades() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Cidade cidade) {
    return ItemLista(
        cidade: cidade,
        alterar: () {
          Navigator.pushNamed(context, Rotas.cidadeForm, arguments: cidade)
              .then((value) => buscarCidades());
        },
        excluir: () {
          dao.excluir(cidade.id);
          buscarCidades();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback alterar;
  final VoidCallback excluir;

  const ItemLista(
      {required this.cidade,
      required this.alterar,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(cidade.nome),
        subtitle: Text(cidade.estado.nome),
        trailing: PainelBotoesCidade(alterar: alterar, excluir: excluir));
  }
}
