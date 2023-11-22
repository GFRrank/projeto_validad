import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/Login/util.dart';

class LoginController {
  String? id;
  String? cargo;

  criarConta(context, nome, email, senha,) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((resultado) {
      // Armazenar o NOME do usuário e outras informações no Firestore
      FirebaseFirestore.instance.collection('usuarios').doc(resultado.user!.uid).set(
        {
          'uid': resultado.user!.uid,
          'nome': nome,
          'id': id,
        },
      );

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email informado é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }
 //
 //AUTENTICAR 
 //
  void autenticar(context, cargo, id, telefone, loja, setor) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: id, password: cargo)
        .then((value) {
      // Salva o ID e o cargo após a autenticação bem-sucedida
      this.id = id;
      this.cargo = cargo;

      //
      //VERIFICA SE FOI BEM SUCEDIDO
      //
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'hub_screen');
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

//
//ID
//
  Future<bool> verificarID(String id) async {
    final docSnapshot = await FirebaseFirestore.instance.collection('usuarios').doc(id).get();
    return docSnapshot.exists;
  }


//
//LOGIN
//

  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'hub_screen');
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }
 //
 //ESQUECEU SENHA
 //
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      sucesso(context, 'E-mail enviado com sucesso.');
    } else {
      erro(context, 'Não foi possível enviar o e-mail');
    }
    Navigator.pop(context);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }
}