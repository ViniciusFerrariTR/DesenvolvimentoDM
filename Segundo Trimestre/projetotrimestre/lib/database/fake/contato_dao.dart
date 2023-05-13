import 'package:flutter/material.dart';
import 'package:projetotrimestre/view/dto/contato.dart';
import 'package:projetotrimestre/view/interface/contato_dao_interface.dart';

class ContatoDAO implements ContatoDAOInterface{
var listaContatos = <Contato>[

  Contato.dados(
    id: 1,
    nome: 'Vinicius Ferrari',
    email: 'ferrarivinicius4@gmail.com',
    telefone: '(44) 997531577',
    URLAvatar: 'https://cdn.pixabay.com/photo/2016/08/18/11/00/man-1602633_1280.png'),
    
    
  Contato.dados(
    id: 2,
    nome: 'Vitor Ferrari',
    email: 'ferrarivitor4@gmail.com',
    telefone: '(44) 997531578',
    URLAvatar: 'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png'),


  Contato.dados(
    id: 2,
    nome: 'Wesley Ferrari',
    email: 'ferrariwesley4@gmail.com',
    telefone: '(44) 997531579',
    URLAvatar: 'https://cdn.pixabay.com/photo/2016/04/01/10/11/avatar-1299805_1280.png'),
    
    ];

  @override
  Future<Contato> alterar(Contato contato) {
    print(contato);
    return Future.value(contato);
  }

  @override
  Future<Contato> buscar(id) {
    return Future.value(listaContatos[id-1]);
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
  }}




/*Trabalho em equipe, resolve os problemas e melhora a programação */





