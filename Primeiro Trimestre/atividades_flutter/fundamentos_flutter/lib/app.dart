

import 'package:flutter/material.dart';

import 'home.dart';

/*   
 Classe abstrata não pode ser instanciada, pois é uma classe de referencia*/
class App extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    /* Retornando um Widget (Objeto do tipo Material App) */


    return MaterialApp(
      title: 'Aula Base',
      home: const Home(),
    );
  }

}