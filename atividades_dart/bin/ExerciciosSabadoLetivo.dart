import 'dart:io';

/*     Função main executa o codigo      */
/*  
void main(List<String> arguments) {



                Chamadas de funções

calcularsalario1();

calcularsalario2(1000, 200)

print(calcularsalario3());

print(calcularsalario4(1000, 200));
*/


/*   
Exercício I
Para cada variante de função que estudamos elaborar a seguinte função:
	→ função calularSalario - precisa do (i) valor salario e o (ii) valor do desconto. Permitir o desconto somente se haver saldo. No final informar o saldo.


*/


/*


               Funções sem retorno e sem parametros

void calcularsalario1(){
double salario, desconto, salarioFinal;


print("informe o salario:");
salario = double.parse(stdin.readLineSync()!);


if(salario > 0){

  print("Informe o desconto:");
  desconto = double.parse(stdin.readLineSync()!);

  salarioFinal = salario - desconto;

  if(desconto > salario){
    print("O valor do desconto é maior do que o salario");
  }
  else{
    print('''o salario liquido é $salarioFinal''');
  }
}
else{
  print("Você não possui saldo");
}
*/






/*



               Funções sem retorno e com parametros



void calcularsalario2(double salario, double desconto) {
double salarioFinal;
if(salario > 0){

  if (desconto > salario) {
      print("O valor do desconto é maior do que o salario");
    } 
    
    else;{
      salarioFinal = salario - desconto;
      print('''
        O salario final é $salarioFinal
      ''');
      print('''o salario liquido é $salarioFinal''');
    }
}

else{
  print("Você não possui saldo");
}

*/

/*



               Funções com retorno e sem parametros


String calcularsalario3() {
double? salario, desconto, salarioFinal;
print("Informe o salario:");
  salario = double.parse(stdin.readLineSync()!);
if (salario > 0) {
  print("Informe o desconto:");
  desconto = double.parse(stdin.readLineSync()!);
    double? salarioFinal = salario - desconto;

    if(desconto > salario){
      return 'O desconto é maior que o salario';
    }
    else{
      return 'O salario liquido é: $salarioFinal';
    }
}
else{
  return 'Voce não tem saldo';
}
*/



/*



               Funções sem retorno e com parametros


String calcularsalario4(double salario, double desconto) {
double salarioFinal;
if(salario > 0){

  var salarioFinal = salario - desconto;

  if(salario > desconto){
  return 'O salario liquido é: $salarioFinal';
  }
  else{
  return 'O desconto é maior que o salario disponivel';
  }
  
}
else{
  return 'Você não possui saldo';
}

}
*/


/*
Exercício II
Pensar em um projeto único - quanto maior o escopo melhor - possibilita pensar em vários exemplos
Elaborar funções no escopo do projeto (autêntico)
Fazer comentários de tudo que entendeu
Elabore: 
1) Duas funções sem retorno e sem parâmetro; 
2) Duas funções sem retorno e com parâmetro; 
3) Duas funções com retorno e sem parâmetro;  
4) Duas funções com retorno e com parâmetro;
5) Duas funções com parâmetros opcionais (com o devido contexto);
6) Duas funções com parâmetros nomeados.
*/


/*1) Duas funções sem retorno e sem parâmetro;  */



/*


Exercício III
1) Em relação a sintaxe, quais são as variantes na escrita de uma função? Quais são as especificidades e em que caso pode-se utilizar cada uma?
 A)


Considerada a sintaxe de função mais eficiente, mas apesar de sua eficiencia, ela acaba se tornando um problema no decorrer do codigo, pois a sua manutenabilidade é comprometida assim que for necessario mudar algum valor, alem de sua reutilização do codigo ser extremamente limitada podendo ser usada em poucas situações.


Função sem retorno e com parâmetro

    Esse tipo de função nos trás pouca eficiência pois com essa sintaxe a função só trata os dados de entrada e não precisa tratar do retorno, então fica mais difícil retornar um valor incorreto. No entanto, seu uso terá limitações e não poderá ser utilizado em outras situações em que
a saída deve ser retornada



Função com retorno e sem parâmetro
 
    Esse tipo de sintaxe tem vantagens e desvantagens. Pode ter código simplificado e pode causar menos erros porque não depende de valores de entrada, ou seja, valores externos. Porém, uma função com este tipo de sintaxe terá limitações por não manipular valores externos
e dificuldades de manutenção.
 
 
 
 Função com retorno e com parametros. 
 
    Considerada a melhor forma de criar funções, a função com retorno e com parametros é a mais completa entre todas. Com uma função que possui essa sintaxe, você pode escrever um bloco de código uma vez e reutilizá-lo
diversas vezes no decorrer do codigo, ajuda tambem na organização de código, além de poder customizar sua função de acordo com o que você precisa;
 */











