import 'package:flutter/material.dart';

void main() {
  runApp(const Telareceita());
}

class Telareceita extends StatelessWidget {
  const Telareceita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("App Senai"),
          leading: Icon(Icons.add),
          actions: [
            Icon(Icons.access_alarm),
            Icon(Icons.favorite),
            Icon(Icons.message),
          ],
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text("Bolo de Chocolate"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Esse bolo de cenoura de \n liquidificador fica pronto em menos \n de uma hora e voce o prepara em \n apenas 20 minutos Ingredientes 3 \n cenouras medias",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star, color: Colors.yellow[700]),
                        Icon(Icons.star),
                        const SizedBox(width: 30),
                        Text("250 Reviews"),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.circle, color: Colors.lightGreen),
                              Text("Preparo"),
                              Text("25min"),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              Icon(Icons.circle, color: Colors.lightGreen),
                              Text("Preparo"),
                              Text("25min"),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              Icon(Icons.circle, color: Colors.lightGreen),
                              Text("Preparo"),
                              Text("25min"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Image.network(
                  "https://t4.ftcdn.net/jpg/06/78/12/01/240_F_678120157_GwrkDJE19x77N2BiSrsml6pN4ef94o8x.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
