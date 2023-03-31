class Estado{
  final String nome;
  final String sigla;
  final Function calcularPIB;
  Estado({required this.nome,required this.sigla,
  required this.calcularPIB});
}

class Cidade{
  final String nome; 
  final Estado estado;
  final Function calcularDensidadeDemografica;
  Cidade({required this.nome, required this.estado, 
  required this.calcularDensidadeDemografica});
}

void main(List<String> arguments){
/*   Exercício 01 - criar um objeto do tipo Cidade com referência anônima na interpolação da função print   */
print('${Cidade(
  nome: 'Terra Rica',
  estado: Estado(
    nome: 'Parana',
    sigla: 'PR',
    calcularPIB:(){
      double produto = 1;
      double servico = 32;
      double habitantes = 3;
      double PIB = (produto + servico) / habitantes;
      print('O valor do PIB é: ${PIB}');
    }
  ),
  calcularDensidadeDemografica: (){
    double area = 1202.3;
    double populacao = 88374;
    double densidadeDemografica = area / populacao;
    print('A Densidade demografica é ${densidadeDemografica}');
  }
  )
}');


var cidade = Cidade(
  nome: 'Terra Rica',
  estado: Estado(
    nome: 'Parana',
    sigla: 'PR',

    /* Criar e entender a sintaxe de uma função anônima */
    calcularPIB:(){
      double produto = 1;
      double servico = 32;
      double habitantes = 3;
      double PIB = (produto + servico) / habitantes;
      print('O valor do PIB é: ${PIB}');
    }
    
  ),


  /* Altere uma das FNs para utilizar Arrow Function */
  calcularDensidadeDemografica: () => {12 / 15}
);
  
}
  /*
  exercício 01 - criar um objeto do tipo Cidade
  com referência anônima na interpolação da função print. 
  Defina mais que um comando para cada FN.
  → criar e entender a sintaxe de uma função anônima
  → entenda quando utilizar ";" e ","

  
  exercício 02 
  - Altere uma das FNs para utilizar Arrow Function
  

  observação:   
  fórmula PIB → (produto + serviço) / habitantes
  Paraná → produto: 1.7, serviço: 1.2 e habitantes 11.08

  fórmula Densidade Demografica →  area / populacao;
  Paranavaí → area = 1202.3, populacao = 88374;
  */
  


