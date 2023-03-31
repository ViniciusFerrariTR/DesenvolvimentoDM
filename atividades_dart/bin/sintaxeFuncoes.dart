import 'dart:io';





//Função main executa o codigo//


void main(List<String> arguments) {
print("Sintaxe Funções");

/*Para rodar o sistema, a função deve ser chamada
verificarAprovacao1();
verificarAprovacao2(6,5);
verificarAprovacao3();
verificarAprovacao4(6,5);
}
*/

/* Funções sem retorno e sem parametros 
void verificarAprovacao1 (){
double nota1, nota2, media;
String resultado;

print("informe nota 1:");
nota1 = double.parse(stdin.readLineSync()!);
print("Informe nota 2:");
nota2 = double.parse(stdin.readLineSync()!);
media = nota1+nota2 / 2;

if(media > 6){
  print("Aprovado");
}
else{
  print("Reprovado");
}
*/

/* 
Print com operador ternário
print((media > 6) ? 'Aprovado' : 'Reprovado');
}
*/





/* Funções sem retorno e com parametros 
void verificarAprovacao2(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  print((media > 6) ? 'Aprovado' : 'Reprovado');
}

*/




/* Funções com retorno e sem parametros 

String verificarAprovacao3() {
double? nota1, nota2, media;
print("Informe nota1:");
  nota1 = double.parse(stdin.readLineSync()!);

print("Informe nota2:");
  nota2 = double.parse(stdin.readLineSync()!);

media = (nota1 + nota2) / 2;

if(media > 6){
  return 'Aprovado';
}
else{
  return 'Reprovado';
}

}
*/


/* Funções com retorno e com parametros 

String verificarAprovacao4(double nota1, double nota2) {

var media = (nota1 + nota2) / 2;

if(media > 6){
  return "Aprovado";
}
else{
  return "Reprovado";
}

*/






}
