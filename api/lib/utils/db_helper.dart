import 'dart:async';

import 'package:postgres/postgres.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();

  DatabaseHelper.getInstance();

  factory DatabaseHelper() => _instance;

  static PostgreSQLConnection _db;

  FutureOr<PostgreSQLConnection> get db async {
    if (_db != null) return _db;
    _db = await _initDb();
    return _db;
  }

  FutureOr _initDb() async {
    var db = PostgreSQLConnection(
      'localhost',
      5432,
      'keys',
      username: 'postgres',
      password: 'postgres',
    );
    await db.open();

    return db;
  }

  FutureOr close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
