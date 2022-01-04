import 'package:persistencia/models/Contato.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContatoDao {
  static const String sql =
      "CREATE TABLE $_tableName ($_id INTEGER PRIMARY KEY, $_name TEXT, $_accountNumber TEXT)";
  static const String _tableName = "CONTATOS";
  static const String _id = 'id';
  static const String _name = 'nome';
  static const String _accountNumber = 'conta';

  Future<int> salvaContato(Contato contato) {
    // final Database db = await createDatabase();
    // Map<String, dynamic> contactMap = _toMap(contato);
    // return db.insert(_tableName, contactMap);

    return createDatabase().then((db) {
      final Map<String, dynamic> contatoMap = Map();
      contatoMap['id'] = contato.id;
      contatoMap['nome'] = contato.nome;
      contatoMap['conta'] = contato.conta;
      return db.insert('CONTATOS', contatoMap);
    });
  }

  Future<int> buscaId() {
    return createDatabase().then((db) {
      return db.query('CONTATOS ORDER BY id DESC').then((maps) {
        final List<Contato> contacts = [];
        for (Map<String, dynamic> map in maps) {
          final Contato contact = Contato(
            map['id'],
            map['nome'],
            map['conta'],
          );
          contacts.add(contact);
        }
        return contacts == null || contacts.length == 0 ? 0 : contacts[0].id;
      });
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

  Map<String, dynamic> _toMap(Contato contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.nome;
    contactMap[_accountNumber] = contact.conta;
    return contactMap;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
    final List<Contato> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contato contact = Contato(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
