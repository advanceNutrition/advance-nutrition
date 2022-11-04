import 'dart:html';

import 'package:flutter/material.dart';
import 'constant.dart';

class PaginaPerfil extends StatefulWidget {
  const PaginaPerfil({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<PaginaPerfil> {
  //get gradientColors => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              )),
          Positioned(
            top: 100,
            bottom: 30,
            right: 30,
            left: 30,
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 90),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0d47a1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            width: 55,
                            height: 35,
                            child: const Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          //Text("Perfil"),
                        ),

                        //text data NAO TERA NO NOSSO PROJETO
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(children: const [
                                  Text(
                                    "42",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tirar",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                    ),
                                  ),
                                ]),
                                Column(children: const [
                                  Text(
                                    "42",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tirar",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                    ),
                                  ),
                                ]),
                                Column(children: const [
                                  Text(
                                    "40",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tirar",
                                    style: TextStyle(
                                      color: Color(0xff1976d2),
                                      fontSize: 18,
                                    ),
                                  ),
                                ])

                                //FIM DO DATA
                              ],
                            )),

                        // const Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 20,
                        //     right: 20,
                        //     top: 10,
                        //     bottom: 10,
                        //   ),
                        //  child: Divider(thickness: 0.8,
                        // color: Colors.blueGrey,
                        // ),
                        // ),

                        //INFORMACOES PESSOAIS
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text("nome", style: TextStyle(fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text("alguma informacao"),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text("numero"),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.blueGrey,
                          ),
                        ),

                        //INFORMACOES NECESSARIAS PARA O APP*****************************************
                        //profile
                        const ListTile(
                          title: Text("altura(cm)"),
                          leading: Icon(Icons.height),
                          trailing: Text("1.80"),
                        ),
                        const ListTile(
                          title: Text("peso(kg)"),
                          leading: Icon(Icons.balance),
                          trailing: Text("80"),// nao tem a opcao massa
                        ),
                        const ListTile(
                          title: Text("genero"),
                          leading: Icon(Icons.transgender),
                          trailing: Text("M"),
                        ),
                        const ListTile(
                          title: Text("idade"),
                          leading: Icon(Icons.person),
                          trailing: Text("25"),
                        ),
                        const ListTile(
                          title: Text("atividade"),
                          leading: Icon(Icons.local_activity),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("objetivo"),
                          leading: Icon(Icons.done),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("refeição"),
                          leading: Icon(Icons.lunch_dining),
                          trailing: Text("teste"),
                        ),

                        //results
                        const ListTile(
                          title: Text("taxa metabólica basal"),
                          leading: Icon(Icons.local_fire_department),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("índice máximo do corpo"),
                          leading: Icon(Icons.egg),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("necessidade de água"),
                          leading: Icon(Icons.water_drop_outlined),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("necessidade calórica diária"),
                          leading: Icon(Icons.local_fire_department_outlined),
                          trailing: Text("teste"),
                        ),

                        //My content
                        const ListTile(
                          title: Text("My foods"),
                          leading: Icon(Icons.food_bank_outlined),
                          trailing: Text("teste"),
                        ),

                        //outros
                        const ListTile(
                          title: Text("politica de privacidade"),
                          leading: Icon(Icons.shield_outlined),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text("compartilhar"),
                          leading: Icon(Icons.share),
                          trailing: Text("teste"),
                        ),
                        const ListTile(
                          title: Text(
                            "sair",
                            style: TextStyle(color: Colors.red),
                          ),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),

          //IMAGEM BUCETA
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),

              // child: Image.asset(Icons.gen,
              //  height: 120,
              //  width: 120,
              //  fit: BoxFit.cover,
            ),
          ),
          //)
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - 30)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
