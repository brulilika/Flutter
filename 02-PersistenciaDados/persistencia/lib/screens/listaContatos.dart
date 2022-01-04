import 'package:flutter/material.dart';
import 'package:persistencia/database/dao/ContatoDao.dart';
import 'package:persistencia/models/Contato.dart';
import 'package:persistencia/screens/novoContato.dart';
import 'package:persistencia/database/app_database.dart';

class ListaContatos extends StatelessWidget {
  final List<Contato> contatos = [];
  final ContatoDao _dao = ContatoDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1))
            .then((callback) => _dao.buscaContato()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
            case ConnectionState.done:
              final List<Contato>? contatos = snapshot.data;
              if (contatos != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contato contato = contatos[index];
                    return ItemContato(contato);
                  },
                  itemCount: contatos.length,
                );
              }
              return Container();
            default:
              return Text('Não foi possível carregar lista de contatos');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NovoContato()));
        },
      ),
    );
  }
}

class ItemContato extends StatelessWidget {
  final Contato contato;

  ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(contato.conta, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
