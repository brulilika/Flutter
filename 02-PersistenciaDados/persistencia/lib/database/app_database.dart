import 'package:path/path.dart';
import 'package:persistencia/database/dao/ContatoDao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.sql);
    },
    version: 1,
  );
  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'persistencia.db');
  //   return openDatabase(path, onCreate: (db, version) {
  //     db.execute(
  //         '');
  //   }, version: 1);
  // });
  // onDowngrade: onDatabaseDowngradeDelete -> limpeza de banco
}
