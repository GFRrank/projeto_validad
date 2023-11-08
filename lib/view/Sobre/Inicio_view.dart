import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio',
      routes: {
        'inicio': (context) => const Inicio(),
      },
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Assim aumentando da tela e da imagem central de acordo com a tela
    double hig = MediaQuery.of(context).size.height; 
    double wid = MediaQuery.of(context).size.width;
    double maiorEixo;
    if (wid>hig){
      maiorEixo = wid;
    }
    else{
      maiorEixo = hig;
    }
    
    return Scaffold(
      body: Container(
        height: hig,
        width: wid,
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
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child:
                Image.asset("assets/gfrlogo.png", color: Colors.white, scale: 900/maiorEixo,),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 500,
              height: 40,
              child: ElevatedButton(
                style:
                  ElevatedButton.styleFrom(
                    backgroundColor:Colors.green[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                  ),
                child: const Text('Iniciar'),
                onPressed: () {
                  Navigator.pushNamed(context, 'autent');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
