import 'package:flutter/material.dart';

import '../../database/sqlite/dao/cidade_dao_sqlite.dart';
import '../../dto/Cidade.dart';

class CampoOpcoesCidade extends StatefulWidget {
  Cidade? opcaoSelecionado;
  CampoOpcoesCidade({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesCidade> createState() => _CampoOpcoesCidadeState();
}

class _CampoOpcoesCidadeState extends State<CampoOpcoesCidade> {
  void associarCidade(Cidade cidade) {
    setState(() {
      widget.opcaoSelecionado = cidade;
    });
  }

  late Future<List<Cidade>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = CidadeDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dadosBD,
      builder: (BuildContext context, AsyncSnapshot<List<Cidade>> resultado) {
        if (!resultado.hasData) return const CircularProgressIndicator();
        if (resultado.data == null)
          return const Text('Faça o cadastro de cidade primeiro.');
        List<Cidade> cidades = resultado.data!;
        List<DropdownMenuItem<Cidade>> itensCidade = cidades
            .map((cidade) =>
                DropdownMenuItem(value: cidade, child: Text(cidade.nome)))
            .toList();

        return DropdownButtonFormField<Cidade>(
          hint: const Text('Cidade onde mora'),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          isExpanded: true,
          items: [
            ...itensCidade,
            DropdownMenuItem(
              value: null,
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adicionar cidade'),
                onTap: () {
                  Navigator.pushNamed(context, 'cidadeForm');
                },
              ),
            ),
          ],
          value: widget.opcaoSelecionado,
          onChanged: (cidadeEscolhida) {
            if (cidadeEscolhida != null) associarCidade(cidadeEscolhida);
          },
        );
      },
    );
  }
}
