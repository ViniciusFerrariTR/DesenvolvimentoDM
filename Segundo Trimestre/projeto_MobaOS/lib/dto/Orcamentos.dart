class Orcamentos {
  final dynamic id;
  final String nome;
  final String servico;
  final String endereco;
  final String telefone;
  final String email;
  final String urlAvatar;
  StatusOrcamento statusOrcamento;
  OrcamentoConcluido orcamentoConcluido;

  Orcamentos({
      this.id,
      required this.nome,
      required this.servico,
      required this.endereco,
      required this.telefone,
      required this.email,
      required this.urlAvatar,
      this.statusOrcamento = StatusOrcamento.NAO_VERIFICADO,
      this.orcamentoConcluido = OrcamentoConcluido.EM_ANDAMENTO
});

  @override
  String toString() {
    return '''
      $id
      $nome 
      $servico
      $endereco
      $telefone
      $email
      $urlAvatar
      $statusOrcamento
    ''';
  }
}

enum OrcamentoConcluido{
  CONCLUIDO,
  EM_ANDAMENTO

}
enum StatusOrcamento {
  ACEITO,
  RECUSADO,
  NAO_VERIFICADO
}