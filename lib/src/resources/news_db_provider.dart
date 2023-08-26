import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
        CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            type Text,
            by Text,
            time INTEGER,
            text Text,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url Text,
            score INTEGER,
            title Text,
            descendants INTEGER
          )
      """);
    });
  }

  fetchItem(int id) async {
    db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}