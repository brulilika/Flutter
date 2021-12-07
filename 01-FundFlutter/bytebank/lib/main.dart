import 'package:flutter/material.dart';

void main() => runApp(Column(
      children: <Widget>[
        Text('Texto um', textDirection: TextDirection.ltr),
        Text('Texto dois', textDirection: TextDirection.ltr),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain,
            child: FlutterLogo(),
          ),
        ),
        Column(children: <Widget>[
          Text('Texto tres', textDirection: TextDirection.ltr),
        ]),
      ],
    ));
