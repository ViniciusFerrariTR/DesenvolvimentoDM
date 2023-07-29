class Usuario {
  final dynamic id;
  final String usuario;
  final String endereco;
  final String telefone;
  final String email;
  final String senha;


  Usuario ({
  this.id,
  required this.usuario,
  required this.endereco,
  required this.telefone,
  required this.email,
  required this.senha
});

factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      usuario: map['usuario'],
      endereco: map['endereco'],
      telefone: map['telefone'],
      email: map['email'],
      senha: map['senha'],
    );
  }

  @override
  String toString (){
    return '''
    $id
    $usuario
    $endereco
    $telefone
    $email
    $senha
    ''';
  }



}


