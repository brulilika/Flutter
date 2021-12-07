// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      //Aplicacao de tecnicas de extração de codigos
      body: ListaTransferencia(),
    )));

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
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.00, 123)),
        ItemTransferencia(Transferencia(200.00, 456)),
        ItemTransferencia(Transferencia(300.00, 789)),
      ],
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
