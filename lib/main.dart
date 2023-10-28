import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto_valid/view/Login_view.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/Cadastro_Func_view.dart';
import 'package:projeto_valid/view/HubScreen_view.dart';
import 'package:projeto_valid/view/Inicio_view.dart';
import 'package:projeto_valid/view/Cadastro_Esto_view.dart';
import 'package:projeto_valid/view/Produtos_view.dart';
import 'package:projeto_valid/view/Sobre_view.dart';
import 'package:projeto_valid/view/Autentificação_view.dart';
import 'package:projeto_valid/view/Configurações_view.dart';
import 'package:projeto_valid/view/ExcelDataViewer_view.dart';







void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio', // Alterado de 'principal' para 'Inicial'
      routes: {
        'inicio': (context) => const Inicio(), // Adicione a rota para a tela de login
        'login': (context) => const LoginView(), // Adicione a rota para a tela de login
        'esqueceu_senha': (context) => EsqueceuSenhaView(), // Adicione a rota para a tela EsqueceuSenhaView
        'hub_screen': (context) => const HubScreen(), // Adicione a rota para a tela HubScreenView
        'cadastro_func': (context) => CadastroFunc(), // Adicione esta linha
        'cadastro_estoque': (context) =>  CadastroEstoque(), // Adicione esta linha
        'produtos': (context) =>  Produtos(), // Adicione esta linha
        'sobre': (context) =>  Sobre(), // Adicione esta linha
        'configuraçoes': (context) =>  Config(), // Adicione esta linha
        'autent': (context) =>  Autenticacao(), // Adicione esta 
        'excel': (context) =>  ExcelDataViewer(), // Adicione esta linha


        
      },

    );
  }
}
