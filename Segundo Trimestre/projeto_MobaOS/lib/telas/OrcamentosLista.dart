import 'package:flutter/material.dart';
import 'package:projeto_um/database/sqlite/dao/orcamentos_dao_sqlite.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:projeto_um/rotas.dart';
import 'package:projeto_um/widget/BotaoAdicionar.dart';
import 'package:projeto_um/widget/widget_nao_validados/foto_contato.dart';
import 'package:projeto_um/widget/widget_nao_validados/painel_botoes.dart';

class OrcamentosLista extends StatefulWidget {
  const OrcamentosLista({Key? key}) : super(key: key);

  @override
  State<OrcamentosLista> createState() => _OrcamentosListaState();
}

class _OrcamentosListaState extends State<OrcamentosLista> {
  OrcamentosInterfaceDAO dao = OrcamentosDAOSQlite();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orcamentos')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () => Navigator.pushNamed(context, Rotas.orcamentosForm).then((value) => setState((){})),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Aceitos',
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, Rotas.orcamentosListaAceitos);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  Future<List<Orcamentos>> buscarOrcamentos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: dao.consultarTodos(),
      builder: (context, AsyncSnapshot<List<Orcamentos>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há orçamentos!!!');
        List<Orcamentos> listaOrcamentos = lista.data!;
        return ListView.builder(
          itemCount: listaOrcamentos.length,
          itemBuilder: (context, indice) {
            var orcamentos = listaOrcamentos[indice];
            return criarItemLista(context, orcamentos);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Orcamentos orcamentos) {
    return ItemLista(
        orcamentos: orcamentos,
        aceitar: () {
          dao.aceitar(orcamentos);
          buscarOrcamentos();
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.orcamentosDetalhes, arguments: orcamentos);
        },
        excluir: () {
          dao.excluir(orcamentos.id);
          buscarOrcamentos();
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
      leading: FotoOrcamentos(orcamentos: orcamentos),
      title: Text('${orcamentos.nome} | ${orcamentos.statusOrcamento} |'),
      subtitle: Text(orcamentos.telefone),
      trailing: PainelBotoes(aceitar: aceitar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
