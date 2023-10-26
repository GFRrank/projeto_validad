import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Desenvolvedores",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white54,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, false),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black38,
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
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Image.asset("assets/gfrlogo.png"),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: Container(
                    height: 1800,
                    width: 1650,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(64),
                      ),
                    ),
                    padding:
                        const EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: ListView(
                      children:[
                        SizedBox(
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
                                        Colors.black))),
                        ),
                        const SizedBox(height:
                          30), Center(child:
                            SizedBox(width:
                              90, height:
                                90, child:
                                  ClipRRect(child:
                                    Image.asset("assets/gf - eu.jpg"),
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
                                        Colors.black)))),
                        const SizedBox(height:
                          50), Container(child:
                            const Center(child:
                              Text("O aplicativo Validad é uma solução inovadora de controle de validade móvel,\n"
                                "projetada especificamente para empresas de médio a grande porte.\n"
                                "Este aplicativo oferece uma maneira eficiente e eficaz de gerenciar e monitorar a validade dos produtos,\n"
                                "garantindo que as empresas estejam sempre em conformidade com as regulamentações e normas do setor.\n"
                                "Com o Validad, as empresas podem evitar desperdícios desnecessários,\n"
                                "melhorar a eficiência operacional e aumentar a satisfação do cliente.",
                                textAlign:
                                  TextAlign.justify, style:
                                    TextStyle(fontSize:
                                      15, fontWeight:
                                        FontWeight.bold, color:
                                          Colors.black)))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
