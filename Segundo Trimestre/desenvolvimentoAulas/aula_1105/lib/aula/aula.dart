// metodo assincrono
// aula função assíncrona; await, async, Future, delayed, Duration (onde e quando utilizar).

void main() async {
  print("abre a página");
  await buscarDados();
  print("carrega os botões");
  print("carrega os campos");
  print("carrega as imagens");
}

Future buscarDados() async {
  await Future.delayed(Duration(seconds: 5), () => print("carrega os dados"));
}
