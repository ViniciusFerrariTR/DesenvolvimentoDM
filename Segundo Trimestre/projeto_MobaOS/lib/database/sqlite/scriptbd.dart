
const criarOrcamento = ['''
  CREATE TABLE orcamentos(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,servico VARCHAR (200) NOT NULL
    ,endereco VARCHAR (200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
    ,statusOrcamento VARCHAR(150) DEFAULT 'NAO_VERIFICADO'
    ,orcamentoConcluido TEXT DEFAULT 'EM_ANDAMENTO'
  )''',
'''
 CREATE TABLE estado(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,sigla CHAR(2) NOT NULL
  )
''',
  '''
 CREATE TABLE cidade(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,estado_id INTEGER NOT NULL
    ,FOREIGN KEY (estado_id) REFERENCES estado (id) 
  )
''',
];



const insercoesOrcamentos = [
'''
INSERT INTO orcamentos (nome, servico, endereco, telefone, email, url_avatar, statusOrcamento, orcamentoConcluido)
VALUES (
  'Vinicius',
  'Encanamento',
  'Rua Guerino Rossini',
  '(44) 9 97531577',
  'ferrari@email.com',
  'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png',
  'NAO_VERIFICADO',
  'EM_ANDAMENTO'
  )
''',
'''
INSERT INTO estado (nome, sigla)
VALUES ('PARANÁ','PR')
''',
  '''
INSERT INTO estado (nome, sigla)
VALUES ('SÃO PAULO','SP')
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('PARANAVAÍ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('MARINGÁ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('BAURU',2)
''',

];


