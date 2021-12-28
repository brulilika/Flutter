import 'package:flutter/material.dart';
import 'package:persistencia/screens/listaContatos.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 35,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListaContatos()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
