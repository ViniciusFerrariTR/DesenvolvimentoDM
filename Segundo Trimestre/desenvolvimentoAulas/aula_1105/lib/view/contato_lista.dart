import 'package:aula_1105/database/fake/contato_dao.dart';
import 'package:aula_1105/view/dto/contato.dart';
import 'package:aula_1105/view/interface/contato_dao_interface.dart';
import 'package:flutter/material.dart';
import 'package:aula_1105/rota.dart';

class ContatoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Contatos')),
        body: criarLista(context),
        floatingActionButton: criarBotao(context),
        bottomNavigationBar: criarBarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget criarLista(BuildContext context) {
    ContatoDAOInterface dao = ContatoDAO();

    return FutureBuilder(
        future: dao.buscarTodos(),
        builder: (BuildContext context, AsyncSnapshot<List<Contato>> lista) {
          if (!lista.hasData) return CircularProgressIndicator();
          if (lista.data == null) return Container();
          List<Contato> listaContato = lista.data!;
          return ListView.builder(
              itemCount: listaContato.length,
              itemBuilder: (context, indice) {
                var contato = listaContato[indice];
                return criarItemLista(contato, context);
              });
        });
  }

  /* Definir um widget mais bonito e completo
    //sugestão ListTitle
    leading/CircleAvatar/backgroundImagem, title, subtitle
    --> bloco de excluir e alterar - show >>> AAA
     */
  Widget criarItemLista(Contato contato, BuildContext context) {
    ContatoDAOInterface dao = ContatoDAO();
    return ListTile(
      title: Text(contato.nome!),
      subtitle: Text(contato.telefone!),
      leading: CircleAvatar(backgroundImage: NetworkImage(contato.URLAvatar!)),
      trailing: Wrap(
        children: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                dao.excluir(contato.id!);
              }),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print(contato);
              dao.alterar(contato);
              Navigator.pushNamed(context, "contato_form");
            },
          )
        ],
      ),
    );
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
