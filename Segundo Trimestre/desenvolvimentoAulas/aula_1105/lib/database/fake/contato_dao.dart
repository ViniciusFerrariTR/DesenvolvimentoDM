import 'package:aula_1105/view/dto/contato.dart';
import 'package:aula_1105/view/interface/contato_dao_interface.dart';

class ContatoDAO implements ContatoDAOInterface {
  var listaContatos = <Contato>[
    Contato.dados(
        id: 1,
        nome: 'João Pereira',
        email: 'joao@gmail.com',
        telefone: '(44) 99999-9999',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2023/05/03/18/05/great-crested-grebe-7968287_1280.jpg'),
    Contato.dados(
        id: 2,
        nome: 'João Oliveira',
        email: 'oliveira@gmail.com',
        telefone: '(44) 88888-8888',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2023/05/03/09/16/rooster-7967053_1280.jpg'),
    Contato.dados(
        id: 3,
        nome: 'João Barbosa',
        email: 'barbosa@gmail.com',
        telefone: '(44) 77777-7777',
        URLAvatar:
            'https://cdn.pixabay.com/photo/2023/04/29/06/33/color-7957849_1280.jpg')
  ];

  @override
  Future<Contato> alterar(Contato contato) {
    print(contato);

    return Future.value(contato);
  }

  @override
  Future<Contato> buscar(id) {
    print(id);

    return Future.value(listaContatos[id - 1]);
  }

  @override
  Future<List<Contato>> buscarTodos() {
    return Future.value(listaContatos);
  }

  @override
  Future<bool> excluir(id) {
    print(id);

    return Future.value(true);
  }

  @override
  Future<Contato> salvar(Contato contato) {
    print(contato);

    return Future.value(contato);
  }
}
