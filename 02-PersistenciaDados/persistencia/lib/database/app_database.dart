import 'package:path/path.dart';
import 'package:persistencia/models/Contato.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'persistencia.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE CONTATOS (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, conta TEXT)');
    }, version: 1);
  });
  // onDowngrade: onDatabaseDowngradeDelete -> limpeza de banco
}

Future<int> salvaContato(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['id'] = contato.id;
    contatoMap['nome'] = contato.nome;
    contatoMap['conta'] = contato.conta;
    return db.insert('CONTATOS', contatoMap);
  });
}

Future<List<Contato>> buscaContato() {
  return createDatabase().then((db) {
    return db.query('CONTATOS').then((maps) {
      final List<Contato> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contato contact = Contato(
          map['id'],
          map['nome'],
          map['conta'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
