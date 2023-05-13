class Contato{
  dynamic id;
  String? nome;
  String? telefone;
  String? email;
  String? URLAvatar;
/* Função do DTO: É criado para que toda interface depender dela mesmo e não da mudança da tecnologia */

  Contato();

  Contato.dados({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.URLAvatar
  });


/* Comando para imprimir os dados ao invés de apenas o objeto */
  @override
  String toString(){
    return '''
      $nome
      $telefone
      $email
      $URLAvatar
    ''';
  }

  void remove(Contato contato) {}
}