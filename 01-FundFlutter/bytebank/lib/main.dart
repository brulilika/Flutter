// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';

//Coloca isso no root
void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

/*
Refatorações aplicadas seguindo as boas praticas de programacao
apresentadas
*/

/*
A diferença mais importante é que o stateless é um widget estático, ou seja, 
não temos como gerenciar o estado dele. E o stateful é completamente dinâmico 
e nos dá o poder de torná-lo mutável através da gerência de estados.
https://www.alura.com.br/artigos/flutter-diferenca-entre-stateless-e-statefull-widget
*/
class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.00, 123)),
          ItemTransferencia(Transferencia(200.00, 456)),
          ItemTransferencia(Transferencia(300.00, 789)),
        ],
      ),
    );
  }
}

//Quebra dos componentes em menores partes
class ItemTransferencia extends StatelessWidget {
  Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

//Classe para auxiliar no significado do que esta sendo realizado
class Transferencia {
  late final double valor;
  late final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numContaController = TextEditingController();
  final TextEditingController _valorTransController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _numContaController,
              maxLength: 5,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '00000',
                  counterText: ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _valorTransController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                  labelText: 'Valor transferência',
                  hintText: '00,00',
                  icon: Icon(Icons.monetization_on)),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final int? numeroConta = int.tryParse(_numContaController.text);
                final double? valor =
                    double.tryParse(_valorTransController.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Conta: ${transferenciaCriada.numeroConta} Valor: ${transferenciaCriada.valor}'),
                    ),
                  );
                }
              },
              child: Text('Confirmar'))
        ],
      ),
    );
  }
}
