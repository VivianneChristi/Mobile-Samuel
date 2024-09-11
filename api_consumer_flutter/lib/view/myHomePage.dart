import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1; // Começa com 1.
  List<Map<String, String>> _products = []; // Lista para armazenar produtos

  void _getData() async {
    if (_counter > 20) {
      return;
    }

    var url = Uri.https('fakestoreapi.com', '/products/' + _counter.toString());

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      // Verifica se a resposta é um mapa e contém as chaves 'title' e 'image'
      if (jsonResponse is Map<String, dynamic> &&
          jsonResponse.containsKey('title') &&
          jsonResponse.containsKey('image')) {
        setState(() {
          _products.add({
            'title': jsonResponse['title'],
            'image': jsonResponse['image'],
          });
        });
      } else {
        print('Unexpected response format.');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {
      if (_counter < 20) {
        _counter++;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 1;
      _products.clear(); // Limpa a lista ao redefinir o contador
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            leading: Image.network(
              product['image']!,
              width: 50,
              height: 200,
              fit: BoxFit.cover,
            ),
            title: Text(product['title']!),
          );
        },
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 16.0,
            right: 96.0,
            child: FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.restore),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _counter < 20 ? _getData : null,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
