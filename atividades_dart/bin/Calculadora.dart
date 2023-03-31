import 'dart:io';

/*     Função main executa o codigo      */

void main(List<String> arguments) {

print(calculadora());
}

String calculadora(){
  double? num1, num2, resultado;
  String operacao;

  stdout.write("Digite o primeiro número: ");
  num1 = double.parse(stdin.readLineSync()!);
  stdout.write("Digite a operação desejada(+,   -,   /,   *): ");
  operacao = stdin.readLineSync()!;

  if (operacao == '+') {
      stdout.write("Digite o segundo número: ");
      num2 = double.parse(stdin.readLineSync()!);
      resultado = num1 + num2;
      return 'O resultado da operação é: $resultado';
   } 
  else if(operacao == '-'){
      stdout.write("Digite o segundo número: ");
      num2 = double.parse(stdin.readLineSync()!);
      resultado = num1 - num2;
      return 'O resultado da operação é: $resultado';

  }
  else if (operacao == '*') {
      stdout.write("Digite o segundo número: ");
      num2 = double.parse(stdin.readLineSync()!);
      resultado = num1 * num2;
      return 'O resultado da operação é: $resultado';
  }
  else if (operacao == '/') {
      stdout.write("Digite o segundo número: ");
      num2 = double.parse(stdin.readLineSync()!);
      resultado = num1 / num2;
      return 'O resultado da operação é: $resultado';
  }

   else {
      return 'Operação invalida';
    }
    
}

  








