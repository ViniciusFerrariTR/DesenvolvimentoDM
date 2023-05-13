main() async {
  print('abre a pagina');
  await buscarDados();
  print('carrega os botões');
  print('carrega os campos');
  print('carrega as imagens');
}

Future buscarDados()async{
  await Future.delayed(Duration(seconds: 5), ()=>print ('Carrega dados'));  
}