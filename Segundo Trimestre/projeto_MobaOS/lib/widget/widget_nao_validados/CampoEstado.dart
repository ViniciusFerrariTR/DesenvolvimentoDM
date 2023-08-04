import 'package:flutter/material.dart';
import '../../database/sqlite/dao/estado_dao_sqlite.dart';
import '../../dto/Estado.dart';

class CampoOpcoesEstado extends StatefulWidget {
  Estado? opcaoSelecionado;
  CampoOpcoesEstado({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesEstado> createState() => _CampoOpcoesEstadoState();
}

class _CampoOpcoesEstadoState extends State<CampoOpcoesEstado> {
  void associarEstado(Estado estado) {
    setState(() {
      widget.opcaoSelecionado = estado;
    });
  }

  late Future<List<Estado>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = EstadoDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dadosBD,
      builder: (BuildContext context, AsyncSnapshot<List<Estado>> resultado) {
        if (!resultado.hasData) return const CircularProgressIndicator();
        if (resultado.data == null)
          return const Text('Faça o cadastro de estado primeiro.');
        List<Estado> estados = resultado.data!;
        List<DropdownMenuItem<Estado>> itensEstado = estados
            .map((estado) =>
                DropdownMenuItem(value: estado, child: Text(estado.nome)))
            .toList();

        return DropdownButtonFormField<Estado>(
          hint: const Text('Estado onde mora'),
          isExpanded: true,
          items: [
            ...itensEstado,
            DropdownMenuItem(
              value: null,
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adicionar estado'),
                onTap: () {
                  Navigator.pushNamed(context, 'estadoForm');
                },
              ),
            ),
          ],
          value: widget.opcaoSelecionado,
          onChanged: (estadoEscolhido) {
            if (estadoEscolhido != null) associarEstado(estadoEscolhido);
          },
        );
      },
    );
  }
}
