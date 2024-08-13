import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha dashboard")),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
            ),
          ),
          const Row(
            children: [
              Icon(Icons.location_on),
              Text("Cotia, São Paulo"),
            ],
          ),
          const Padding(
            padding: const EdgeInsets.all(35.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Pesquisar na loja',
                prefixIcon: Icon(Icons.search),
                fillColor: Color.fromARGB(255, 209, 209, 209),
                filled: true,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 27, 27, 27),
                    spreadRadius: 3),
              ],
            ),
            width: 600,
            height: 150,
          ),
          Text("Card Propaganda"),
          Text("Ofertas"),
          Text("Card de frutas"),
          Text("Mais vendidos"),
          Text("Ofertas"),
        ],
      ),
    );
  }
}
