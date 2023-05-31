# Conteúdo
* Implementação da classe de conexão;
* Implementação do DAO SQLite;

# Pontos principais:

## Classe de conexão:
    * sqflite é um plugin para trabalhar com o SQLite -> (flutter pub add sqflite);
    * Path: pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO) -> flutter pub add path;
    * Precisamos definir o script do banco;
    * Com a definição do script, você pode utilizar em qualquer lugar do sistema;
    * script.dart: somente criação do banco;
    * conexão.dart: de fato que vai realizar a conexão do sistema com o banco;
    * *Conexão* é a parte mais cara de um software;
    * Palavra reservada _late_: significa "calma, vou criar ainda";
    * Método static para criar a conexão: pois vamos ter só uma conexão no software inteiro;
    * Por que Future? Pois o banco de dados leva tempo, precisamos usar o Future pois é assíncrono;
    * Variável Path representa o caminho do banco de dados;
    * onCreate em conexão garante que rode apenas uma vez, ele verifica se já existe o banco. Se existir, não cria; se não existir, ele cria.

## Classe DAO:
    * Primeiro passo é implementar a interface pois é o padrão que impomos -> inversão de dependências;
    * Os dados retornados pelo SQFLite tem o formato de "map<dynamic,dynamic>":
    ** O primeiro dynamic refere-se ao nome da coluna e o segundo o valor;
    * Sempre que a resposta for assíncrono, utilizar await;
    * _Database db = await Conexao.criar();_ é utilizado em cada chamada da classe ContatoDAOSQLite, pois como a conexão é a parte mais cara de um software, fazendo isso você garante a conexão é criada apenas uma vez quando é chamado um método.