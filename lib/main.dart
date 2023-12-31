import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Cadastro/CadastroApp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto_valid/view/Login/Login_view.dart';
import 'package:projeto_valid/view/Login/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/Cadastro/Cadastro_Func_view.dart';
import 'package:projeto_valid/view/Sobre/HubScreen_view.dart';
import 'package:projeto_valid/view/Sobre/Inicio_view.dart';
import 'package:projeto_valid/view/Excel/Produtos_view.dart';
import 'package:projeto_valid/view/Sobre/Sobre_view.dart';
import 'package:projeto_valid/view/Cadastro/Autentifica%C3%A7%C3%A3o_view.dart';
import 'package:projeto_valid/view/Sobre/Configura%C3%A7%C3%B5es_view.dart';
import 'package:projeto_valid/view/Excel/ExcelDataViewer_view.dart';
import 'package:projeto_valid/view/APIs/Whatsapp_view.dart';
import 'package:projeto_valid/view/Excel/Detalhes_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

Widget degradeVerde () {
      return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
                const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
                const Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
              ],
            ),
          ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  degradeVerde() => degradeVerde();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio', // Alterado de 'principal' para 'Inicial'
      routes: {
        'Cadastro_App': (context) => const CadastroApp(), // Adicione a rota para a tela de CadastroApp
        'inicio': (context) => const Inicio(), // Adicione a rota para a tela de inicio
        'login': (context) => const LoginView(), // Adicione a rota para a tela de login
        'esqueceu_senha': (context) => EsqueceuSenhaView(), // Adicione a rota para a tela EsqueceuSenhaView
        'hub_screen': (context) => const HubScreen(), // Adicione a rota para a tela HubScreenView
        'cadastro_func': (context) => CadastroFunc(), // Adicione a rota para a tela CadastroFunc
        'produtos': (context) =>  Produtos(), // Adicione a rota para a tela Produtos
        'sobre': (context) =>  Sobre(), // Adicione a rota para a tela Sobre
        'configuraçoes': (context) =>  Config(), // Adicione a rota para a tela Configurações
        'autent': (context) =>  Autenticacao(), // Adicione esta rota para a tela Autenticação
        'excel': (context) =>  ExcelDataViewer(), // Adicione esta rota para a tela Excel
        'whatsapp': (context) => WhatsappView(), // Adicione esta rota para a tela Whatsapp
        'detalhes': (context) => Detalhes(), // Adicione esta rota para a tela Detalhes
      },
    );
  }
}
