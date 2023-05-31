import 'package:flutter/material.dart';
import 'package:projeto_um/telas/EsqueciSenha.dart';
import 'package:projeto_um/telas/Login.dart';
import 'package:projeto_um/telas/LoginPrimario.dart';
import 'package:projeto_um/telas/OrcamentosDetalhesAceitos.dart';
import 'package:projeto_um/telas/OrcamentosLista.dart';
import 'package:projeto_um/telas/OrcamentosDetalhes.dart';
import 'package:projeto_um/telas/OrcamentosListaAceitos.dart';
import 'package:projeto_um/telas/TelaApresentacaoDois.dart';
import 'package:projeto_um/telas/TelaApresentacaoTres.dart';
import 'package:projeto_um/telas/TelaApresentacaoUm.dart';
import 'package:projeto_um/telas/OrcamentosForm.dart';
import 'rotas.dart';
import 'telas/Cadastro.dart';

class App extends StatelessWidget{


  @override
  Widget build (BuildContext context) {


    return MaterialApp(
      title: 'Tela Um',
      home: Login(),
      theme: ThemeData(primarySwatch: Colors.red
      ),
      routes: {
        Rotas.login: (context) => Login(),
        Rotas.loginPrimario: (context) => LoginPrimario(),
        Rotas.cadastro: (context) => Cadastro(),
        Rotas.apresentacaoUm: (context) => TelaApresentacaoUm(),
        Rotas.apresentacaoDois: (context) => TelaApresentacaoDois(),
        Rotas.apresentacaoTres: (context) => TelaApresentacaoTres(),
        Rotas.esqueciSenha:(context) => EsqueciSenha(),
        Rotas.orcamentosForm:(context) => OrcamentosForm(),
        Rotas.orcamentosDetalhes:(context) => OrcamentosDetalhes(),
        Rotas.orcamentosLista:(context) => OrcamentosLista(),
        Rotas.orcamentosListaAceitos: (context) => OrcamentosListaAceitos(),
        Rotas.orcamentosDetalhesAceitos: (context) => OrcamentosDetalhesAceitos(),
      },
    );
  }
  

}