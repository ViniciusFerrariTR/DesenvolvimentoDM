import 'professor.dart';
import 'package:projetoaulas/classes_atividades/professor.dart';
import 'package:projetoaulas/classes_atividades/aluno.dart';

void main() {
  //criar um objeto aluno no print
  print("${Aluno1(RA: 123, cpf: "13132213123", nome: "Vini lindao")}");

  //  criar um objeto professor com função nomeada
  var professor = Professor(
      CPF: "1233123",
      SIAP: 3123123,
      atuando: true,
      nome: "vidinha",
      telefone: "12313",
      minhaFuncao: outraFuncao);

  // criar um objeto professor com função anônima
  var professor1 = Professor(
      CPF: "3123123",
      SIAP: 1221313,
      atuando: false,
      nome: 'nome',
      telefone: '232323',
      minhaFuncao: () {
        print("Ola vida");
      });

  //criar um objeto professor com arrow function

  var professor2 = Professor(
      CPF: "3123123",
      SIAP: 1221313,
      atuando: false,
      nome: 'nome',
      telefone: '232323',
      minhaFuncao: () => print("Ola vida"));

  //criar um objeto professor com arrow function no print

print("${Professor(CPF: "3123123",
      SIAP: 1221313,
      atuando: false,
      nome: 'nome',
      telefone: '232323',
      minhaFuncao: () => print("Ola vida"))}");
      
      
}

//funcao nomeada
void outraFuncao() {
  print("Ola vida");
}



/* Atividade de Consolidação */








