import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  
  @override
  Widget build(BuildContext context){
    return Container( //Container pai
      color: Colors.red,
      alignment: Alignment.topLeft,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300,
        height: 155,
        child: Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          width: 100,
          height: 50,
          ),
        ),
      );

  }
}