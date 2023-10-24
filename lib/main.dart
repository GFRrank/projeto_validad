import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto_valid/view/Login_view.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/CadastroFunc_view.dart';
import 'package:projeto_valid/view/HubScreen_view.dart';



void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: 'login', // Alterado de 'principal' para 'login'
      routes: {
        'login': (context) => LoginView(), // Adicione a rota para a tela de login
        'esqueceu_senha': (context) => EsqueceuSenhaView(), // Adicione a rota para a tela EsqueceuSenhaView
        'hub_screen': (context) => HubScreen(), // Adicione a rota para a tela HubScreenView
        'cadastro_func': (context) => CadastroFuncView(), // Adicione a rota para CadastroFunc
      },

    );
  }
}
