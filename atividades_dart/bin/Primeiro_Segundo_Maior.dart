import 'dart:io';

/*     Função main executa o codigo      */

String main() {
  String? valores;
  stdout.write(
      "Digite valores separados por espaço para adicionar na lista (1 2 3 4 5 22):");
  valores = stdin.readLineSync();

  List<String> valoresString = valores!.split(" ");
  List<int> valoresInt = valoresString.map(int.parse).toList();
  int maior = valoresInt[0];
  int segundoMaior = valoresInt[0];
  for (int i = 0; i < valoresInt.length; i++) {
    if (valoresInt[i] > maior) {
      segundoMaior = maior;
      maior = valoresInt[i];
    }

    if (valoresInt[i] < maior && valoresInt[i] > segundoMaior) {
      segundoMaior = valoresInt[i];
    }
  }

  return 'O maior valor é: $maior\n O segundo maior é: $segundoMaior';
  }

