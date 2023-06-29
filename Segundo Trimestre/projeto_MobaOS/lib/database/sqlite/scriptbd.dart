const criarOrcamento = [
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
  '''
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
    ,cidade_id INTEGER NOT NULL
    ,FOREIGN KEY (cidade_id) REFERENCES cidade (id)
  )''',
];

const insercoesOrcamentos = [
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
  '''
INSERT INTO orcamentos (nome, servico, endereco, telefone, email, url_avatar, statusOrcamento, orcamentoConcluido, cidade_id)
VALUES ('Vinicius Ferrari','Encanamento','Rua Guerino Rossini','(44) 9 97531577','email@example.com','https://www.google.com/imgres?imgurl=https%3A%2F%2Ficdn.football-espana.net%2Fwp-content%2Fuploads%2F2022%2F12%2FZinedine-Zidane-legend.jpg&tbnid=ptfysuDxPd2ISM&vet=12ahUKEwj75vmZn-f_AhWhLrkGHb_EA5oQMygFegUIARD1AQ..i&imgrefurl=https%3A%2F%2Fwww.football-espana.net%2F2023%2F06%2F25%2Fzinedine-zidane-jude-bellingham-real-madrid&docid=G2CxnfDRd60sgM&w=1600&h=900&q=zidane&ved=2ahUKEwj75vmZn-f_AhWhLrkGHb_EA5oQMygFegUIARD1AQ','NAO_VERIFICADO','EM_ANDAMENTO',1)
''',
];
