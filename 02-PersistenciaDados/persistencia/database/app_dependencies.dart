import 'package:path/path.dart';
import 'package:persistencia/models/Contato.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'persistencia.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE CONTATOS (id INTEGER PRIMARY KEY, nome TEXT, conta TEXT)');
    }, version: 1);
  });
}

void salvaContato(Contato contato) {
  createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['id'] = contato.id;
    contatoMap['nome'] = contato.nome;
    contatoMap['conta'] = contato.conta;
    db.insert('CONTATOS', contatoMap);
  });
}

void buscaContato() {
  createDatabase().then((db) {
    db.query('CONTATOS').then((maps) {
      final List<Contato> listaContatos = <Contato>[];
      for (Map<String, dynamic> map in maps) {
        final Contato novoContato =
            Contato(map['id'], map['nome'], map['conta']);
        listaContatos.add(novoContato);
      }
      return listaContatos;
    });
  });
}
