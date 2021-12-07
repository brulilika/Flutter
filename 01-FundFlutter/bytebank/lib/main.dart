// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bytebank/screens/ListaTransferencia.dart';
import 'package:flutter/material.dart';

//Coloca isso no root
void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: ListaTransferencias(),
    );
  }
}
