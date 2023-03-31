
import 'dart:io';


//Função main executa o codigo//

void main(List<String> arguments) {




/*Padrao de nomenclatura deve ser escrito em minúsculo a menos que sja nome composto
  Tipos de dados (variaveis)

print("Fundamentos de variaveis");
int idade = 19;
double peso = 80.5;
String nome = "Vinicius";
String sobrenome = "Ferrari";
bool eProgramador = true;

print(idade);
print(nome + " " + sobrenome);
*/





/*

Variaveis de inferencia
Uma vez que o tipo da variavel foi atribuido ela não recebe valores de outros tipos
  
  !!!IMPORTANTE!!!
  
  =======Quando usar var ou int=======
  Quando não existe atriuição deve-se usar o tipo Ex: int.
  Quando existe pode-se usar o "var"
  
  
print("Variaveis de inferencia");

var idade = 19;
var peso = 80.5;
var nome = "Vinicius";
var sobrenome = "Ferrari";
var eProgramador = true;


*/






/*Como criar um  INSERT
print("INSERT INTO pessoa (nome,sobrenome) VALUES ('" +nome +"','" +sobrenome +"')");
*/






/*
Como criar um  INSERT com Interpolação
O $ é usado para que o programa reconheça que "nome" é uma variavel (que o trecho do codigo após o $ tem que ser processado)
  print("'INSERT INTO pessoa (nome,sobrenome) VALUES ('$nome','$sobrenome')'");

A falta dos parenteses se dá pelo fato de nome e sobrenome serem uma palavra simples
  String nomeCompleto = '$nome $sobrenome';

*/


/*

Quebrando linha

print('\n linha1'+
'\nlinha2'+
'\nlinha3');
*/



/*Aspas triplas saõ usadas para fazer a quebra de linha sem a necessidade da concatenação e sem o \n
print('''
linha1
linha2
linha3
''');
*/



/* 

Como inserir informações pelo console
Por padrão o valor atribuido a variavel não pode ser nulo
O codigo abaixo foi tratado de forma "Correta" (sem a chance de erros futuros) para que o valor atribuido a variavel não seja nulo 


String nome;
print("Informe seu nome: ");
String? entrada = stdin.readLineSync();
if(entrada != null){
  nome = entrada;
}

*/




/*

O codigo abaixo foi tratado de forma "simples" (com a chance de erros futuros) para que o valor atribuido a variavel não seja nulo

String nome3;
print("Informe seu nome: ");
nome3 = stdin.readLineSync()!;

*/




/* 

Como transformar os tipos de variaveis para String
String para int - int.parse
String para double - double.parse
int para String - 'variavel'.toString()

 */



/*

Atividade 1 - Defina variaveis de um produto(com diversos tipos) e imprima com as devidas escrições
Caracteristicas:

String tipo = "Fone de Ouvido";
String marca = "Soundcore";
String modelo = "Soundcore Q30 Life";
String lote = "VD32SCF";
bool funciona = true;
int bateria = 40;
double pesoGramas = 0.330;

*/


/*

Resposta feita por Interpolação

print('''
O tipo de produto é um $tipo
A marca do produto é $marca
O modelo do produto é $modelo
O lote do produto é $lote
O produto funciona? $funciona
Duração da bateria em horas: $bateria
O peso do produto é: $pesoGramas
''');


*/






/*Atividade 2 - Conforme seu projeto particular defina as variaveis de um modelo e imprima na tela
String medicamento = "Sertralina";
String laboratorio = "Medley";
String lote = "VD32SCF";
bool psicotropico = true;
double dosagem = 0.330;

print('''
O medicamento é uma $medicamento
O laboratório do medicamento é $laboratorio
O lote do produto é $lote
O produto é um psicotropico? $psicotropico
Dosagem do medicamento $dosagem mg
''');
*/

/*Atividade 3 - Ao invés de atribuir valores, solicite dados.
Variaveis:

String? tipo;
String? marca;
String? modelo;
bool? funciona;
double? peso;
String? entrada;

print("Informe o tipo do produto: ");
tipo = stdin.readLineSync()!;

print("Informe a marca do produto: ");
marca = stdin.readLineSync()!;

print("Informe o modelo do produto: ");
modelo = stdin.readLineSync()!;

print("Funciona? Informe s ou n:");
entrada = stdin.readLineSync();
funciona = entrada == 's';

print("Informe o peso do produto: ");
peso = double.parse(stdin.readLineSync()!);



print('''
Tipo do produto $tipo
Marca do produto $marca
Modelo do produto $modelo
O produto funciona? $funciona
O peso do produto é $peso g
''');

*/

}




