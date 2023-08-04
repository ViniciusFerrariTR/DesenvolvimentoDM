import 'package:flutter/material.dart';
import '../database/sqlite/dao/estado_dao_sqlite.dart';
import '../dto/Estado.dart';
import '../widget/widget_nao_validados/CampoNome.dart';

class EstadoForm extends StatefulWidget {
  const EstadoForm({Key? key}) : super(key: key);

  @override
  State<EstadoForm> createState() => _EstadoFormState();
}

class _EstadoFormState extends State<EstadoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoSigla = CampoNome(controle: TextEditingController());
  late List<Estado> estados;

  @override
  void initState() {
    super.initState();
    carregarEstados();
  }

  void carregarEstados() async {
    var listaEstados = await EstadoDAOSQLite().consultarTodos();
    setState(() {
      estados = listaEstados;
    });
  }

  @override
  Widget build(BuildContext context) {
    receberEstadoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            campoNome,
            campoSigla,
            criarBotao(context),
          ],
        ),
      ),
    );
  }

  Widget criarBotao(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var estado = preencherDTO();
          await salvarEstado(estado);
          carregarEstados();
          Navigator.pop(context);
        }
      },
      child: const Text('Salvar'),
    );
  }

  void receberEstadoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Estado estado = parametro.settings.arguments as Estado;
      id = estado.id;
      preencherCampos(estado);
    }
  }

  Estado preencherDTO() {
    return Estado(
      id: id,
      nome: campoNome.controle.text,
      sigla: campoSigla.controle.text,
    );
  }

  void preencherCampos(Estado estado) {
    campoNome.controle.text = estado.nome;
    campoSigla.controle.text = estado.sigla;
  }

  Future<void> salvarEstado(Estado estado) async {
    EstadoDAOSQLite dao = EstadoDAOSQLite();
    await dao.salvar(estado);
  }
}
