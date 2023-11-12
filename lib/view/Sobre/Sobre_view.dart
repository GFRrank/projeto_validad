import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: degradeVerde(),
        title: const Text(
          "Desenvolvedores",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset("assets/gfrlogo.png"),
            Expanded(
              child: ListView(
                children: [ SizedBox(
                          width: 90,
                          height: 90,
                          child:
                              Center(child:
                                ClipRRect(child:
                                  Image.asset("assets/ronald.jpeg"),
                                  borderRadius:
                                    const BorderRadius.all(Radius.circular(360)))),
                        ),
                        const SizedBox(height:
                          10), Container(child:
                            const Center(child:
                              Text("Ronald Viana da Silva",
                                style:
                                  TextStyle(fontSize:
                                    15, fontWeight:
                                      FontWeight.w400, color:
                                       Color.fromARGB(255, 237, 226, 226)))),),
                        const SizedBox(height:
                          30), Center(child:
                            SizedBox(width:
                              90, height:
                                90, child:
                                  ClipRRect(child:
                                    Image.asset("assets/gui.jpg"),
                                    borderRadius:
                                      const BorderRadius.all(Radius.circular(360))))),
                        const SizedBox(height:
                          10), Container(child:
                            const Center(child:
                              Text("Guilherme Fco Alves Rodrigues",
                                style:
                                  TextStyle(fontSize:
                                    15, fontWeight:
                                      FontWeight.w400, color:
                                        Color.fromARGB(255, 237, 226, 226))))),
                        const SizedBox(height: 50
                          ), Container( width: 300, child: 
                            const Center(child: 
                              Text(" O aplicativo Validad é uma solução inovadora de controle de validade móvel,"
                                " projetada especificamente para empresas de médio a grande porte. "
                                " Este aplicativo oferece uma maneira eficiente e eficaz de gerenciar e monitorar a validade dos produtos, "
                                " garantindo que as empresas estejam sempre em conformidade com as regulamentações e normas do setor. "
                                " Com o Validad, as empresas podem evitar desperdícios desnecessários, "
                                " melhorar a eficiência operacional e aumentar a satisfação do cliente. ",
                                textAlign:
                                  TextAlign.justify, style:
                                    TextStyle(fontSize:
                                      15, fontWeight:
                                        FontWeight.bold, color:
                                         Color.fromARGB(255, 237, 226, 226)
                                         )
                                         )
                                         )
                                         ),
                      ],
                    ),
                 ),
              ],
            ),
         ),
      );
   }
 }
              