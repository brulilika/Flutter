import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  Produto(
    this.nome,
    this.quantidade,
    this.valor,
  );
}

class MyApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _controladorQuantidade,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _controladorValor,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
              ),
              TextButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final int quantidade = int.parse(_controladorQuantidade.text);
                  final double valor =
                      double.parse(_controladorValor.text.replaceAll(",", "."));

                  final Produto produtoNovo = Produto(nome, quantidade, valor);
                  print(produtoNovo);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
