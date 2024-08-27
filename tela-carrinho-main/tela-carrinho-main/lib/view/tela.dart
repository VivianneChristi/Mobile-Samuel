import 'package:atv01/widgets/button.dart';
import 'package:atv01/widgets/eggs.dart';
import 'package:atv01/widgets/fruits.dart';
import 'package:atv01/widgets/ginger.dart';
import 'package:atv01/widgets/pepper.dart';
import 'package:flutter/material.dart';

class tela extends StatelessWidget {
  const tela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: const Column(
          children: [pepper(), eggs(), fruits(), ginger()],
        ),
        bottomNavigationBar: SizedBox(
          height: 90,
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // cor do botão
                  padding: const EdgeInsets.only(
                      left: 120, right: 90, top: 30, bottom: 30),
                  elevation: 5, // sombreamento do botão
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20)), // forma do botão
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Ir para o carrinho",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white, // cor do texto
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: const Text(
                        "\$12.96",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            backgroundColor: Color.fromRGBO(0, 0, 0, 200)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
