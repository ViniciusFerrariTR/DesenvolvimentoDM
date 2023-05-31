
const criarOrcamentos = '''
  CREATE TABLE orcamentos(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,servico VARCHAR (200) NOT NULL
    ,endereco VARCHAR (200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
    ,statusOrcamento VARCHAR(300) NOT NULL
  )''';


const criarOrcamentosAceitos =
'''CREATE TABLE orcamentosAceitos(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,servico VARCHAR (200) NOT NULL
    ,endereco VARCHAR (200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
    ,statusOrcamento VARCHAR(1) NOT NULL
  )''';

const insercoesOrcamentos = [
'''
INSERT INTO orcamentos (nome, servico, endereco, telefone, email, url_avatar, statusOrcamento)
VALUES (
  'Vinicius',
  'Encanamento',
  'Rua Guerino Rossini',
  '(44) 9 97531577',
  'ferrari@email.com',
  'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png',
  'NAO_VERIFICADO')
'''];



const insercoesOrcamentosAceitos = [
  '''
INSERT INTO orcamentosAceitos (nome, servico, endereco, telefone, email, url_avatar, statusOrcamento)
VALUES (
  ?,?,?,?,?,?,?)
'''
];
