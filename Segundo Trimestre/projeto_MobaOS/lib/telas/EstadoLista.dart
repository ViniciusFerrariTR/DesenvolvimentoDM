import 'package:flutter/material.dart';

import '../database/sqlite/dao/estado_dao_sqlite.dart';
import '../dto/Estado.dart';
import '../interface/estado_interface_dao.dart';
import '../rotas.dart';
import '../widget/BarraNavegacao.dart';
import '../widget/BotaoAdicionar.dart';
import '../widget/widget_nao_validados/painel_botoes_estado.dart';

class EstadoLista extends StatefulWidget {
  const EstadoLista({Key? key}) : super(key: key);

  @override
  State<EstadoLista> createState() => _EstadoListaState();
}

class _EstadoListaState extends State<EstadoLista> {
  EstadoInterfaceDAO dao = EstadoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.estadoForm)
                .then((value) => buscarEstados())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarEstados(),
      builder: (context, AsyncSnapshot<List<Estado>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há Estados...');
        List<Estado> listaEstados = lista.data!;
        return ListView.builder(
          itemCount: listaEstados.length,
          itemBuilder: (context, indice) {
            var estado = listaEstados[indice];
            return criarItemLista(context, estado);
          },
        );
      },
    );
  }

  Future<List<Estado>> buscarEstados() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Estado estado) {
    return ItemLista(
        estado: estado,
        alterar: () {
          Navigator.pushNamed(context, Rotas.estadoForm, arguments: estado)
              .then((value) => buscarEstados());
        },
        excluir: () {
          dao.excluir(estado.id);
          buscarEstados();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Estado estado;
  final VoidCallback alterar;
  final VoidCallback excluir;

  const ItemLista(
      {required this.estado,
      required this.alterar,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(estado.nome),
        subtitle: Text(estado.sigla),
        trailing: PainelBotoesEstado(alterar: alterar, excluir: excluir));
  }
}
