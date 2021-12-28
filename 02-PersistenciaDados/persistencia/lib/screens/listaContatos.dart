import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Nome Pessoa',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Numero Conta', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
