import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Excel/Produtos_view.dart';
 
import '../model/tarefa.dart';
import '../view/login/util.dart';
import 'login_controller.dart';
import '../model/produto.dart';
 
class ProdutoController {
  //
  // ADICIONAR uma nova Tarefa
  //
  void adicionar(context, Produto p) {
    FirebaseFirestore.instance
        .collection('products')
        .add(p.toJson())
        .then((value) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a tarefa.'))
        .whenComplete(() => Navigator.pop(context));
  }
 
  //
  // ATUALIZAR
  //
  void atualizar(context, id, Produto p) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update(p.toJson())
        .then((value) => sucesso(context, 'Produto atualizada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar a tarefa.'))
        .whenComplete(() => Navigator.pop(context));
  }
 
  //
  // EXCLUIR
  //
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Produto excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o produto.'));
  }
 
  //
  // LISTAR todas as Tarefas da coleção
  //
  listar() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}