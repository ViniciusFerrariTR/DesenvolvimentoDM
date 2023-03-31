
/* Criar professor com 2 atributos */

class Professor{
  String? nome;
  int? SIAP;
  String? CPF;
  String? telefone;
  bool? atuando;
  Function minhaFuncao;
  /* Alterar atributos do professor para não nulos */

  Professor({required this.CPF, required this.SIAP,  required this.atuando, required this.nome,
      required this.telefone, required this.minhaFuncao});


}



