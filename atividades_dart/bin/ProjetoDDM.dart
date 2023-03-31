import 'dart:io';



void main(List<String> args) {  
  print('Funcoes com parametros posicionais, nomeados e opcionais');
  minhaFuncao(nome: 'Vinicius',idade: 2,);

  /*
  
    Parametros posicionais 
  
  
  
  
   */


  }
  void minhaFuncao({required String nome, required int idade}) {
    print("Nome: $nome");
    print("Idade: $idade");
}