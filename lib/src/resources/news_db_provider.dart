import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
        CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            deleted INTEGER,
            type TEXT,
            by TEXT,
            time INTEGER,
            text TEXT,
            dead INTEGER,
            parent INTEGER
            kids BLOB,
            url TEXT,
            score INTEGER,
            title STRING,
            descendants INTEGER
          )
      """);
    });
  }

  //TODO: local storage for top id
  Future<List<int>> fetchTopIds() {
    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }
}

final newsDbProvider = NewsDbProvider();