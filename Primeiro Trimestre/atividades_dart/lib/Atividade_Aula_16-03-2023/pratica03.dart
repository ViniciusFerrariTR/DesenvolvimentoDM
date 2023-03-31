class A{
  final String a;
  final String b;
  final Function f;
  A({required this.a,required this.b,
  required this.f});
}

class B{
  final A a;
  final String b; 
  final Function f;
  final String c;
  B({required this.a, required this.b,required this.c, 
  required this.f});
}

void main(List<String> arguments){


  print('${B(
    a: A(
      a: 'A',
      b: 'b', 
      f: (){
        print("Vinicin");
        print("Fazer Comentarios");
      }
    ),
    b: 'Teste',
    c: 'Teste2',
    f: (){
        print("Vinicin");
        print("Fazer Comentarios 2");
    }
    
    /* Arrow Function 
    f: ()=> print("Vinicin")
    */
)}');

  /*
  exercício 01 - criar um objeto do tipo B
  com referência anônima na interpolação da função print. 
  Defina mais que um comando para cada FN.
  → criar e entender a sintaxe de uma função anônima
  → entenda quando utilizar ";" e ","
  
  exercício 02 
  - Altere uma das FNs para utilizar Arrow Function
  

  objetivo:   
  - Treino da Sintaxe - Capacidade de criar objetos sem contexto;
  */
}