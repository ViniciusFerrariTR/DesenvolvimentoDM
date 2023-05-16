import 'package:flutter/material.dart';
import 'package:projetotrimestre/database/fake/contato_dao.dart';
import 'package:projetotrimestre/rota.dart';
import 'package:projetotrimestre/view/contato_detalhe.dart';
import 'package:projetotrimestre/view/contato_form.dart';
import 'package:projetotrimestre/view/interface/contato_dao_interface.dart';

import 'dto/contato.dart';

class ContatoLista extends StatelessWidget {
  const ContatoLista({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Contatos')),
        body: criarLista(),
        floatingActionButton: criarBotao(context),
        bottomNavigationBar: criarBarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista() {
    ContatoDAOInterface dao = ContatoDAO();
    return FutureBuilder(
        future: dao.buscarTodos(),
        builder: (BuildContext context, AsyncSnapshot lista) {
          if (!lista.hasData) return CircularProgressIndicator();
          if (lista.data == null) return Container();
          List<Contato> listaContatos = lista.data!;
          return ListView.builder(
            itemCount: listaContatos.length,
            itemBuilder: (context, indice) {
              var contato = listaContatos[indice];           
              return criarItemLista(contato, context);
            },
          );
        });
  }

  Widget criarItemLista(Contato contato, BuildContext context) {
    ContatoDAOInterface dao = ContatoDAO();
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(contato.URLAvatar!),
        ),
        title: Text(contato.nome!),
        subtitle: Text(contato.email!),
        trailing: Wrap(children: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                dao.excluir(contato.id);
              }),
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContatoForm()),
                );
              })
        ]));
  }

  BottomAppBar criarBarraNavegacao() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}
