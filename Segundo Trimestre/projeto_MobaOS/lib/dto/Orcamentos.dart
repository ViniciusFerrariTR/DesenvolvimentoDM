class Orcamentos {
  final dynamic id;
  final String nome;
  final String servico;
  final String endereco;
  final String telefone;
  final String urlAvatar;

  Orcamentos({
      this.id,
      required this.nome,
      required this.servico,
      required this.endereco,
      required this.telefone,
      required this.urlAvatar
});

  @override
  String toString() {
    return '''
      $id
      $nome 
      $servico
      $endereco
      $telefone 
      $urlAvatar
    ''';
  }
}
