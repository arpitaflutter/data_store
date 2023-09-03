import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:vasundhra_3/screens/data/model/data_model.dart';

class DBHelper {
  static final DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Database? database;

  Future checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "news1.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String Query =
            "CREATE TABLE news1 (id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT, title TEXT, description TEXT,publishedAt TEXT, content TEXT)";
        db.execute(Query);
      },
    );
  }

  Future<void> insertDB({required DataModel d1})
  async {
    database = await checkDB();

    database!.insert("news1", {
      "author":d1.author,
      "title":d1.title,
      "description":d1.description,
      "publishedAt":d1.publishedAt,
      "content":d1.content
    });
  }

  Future<List<DataModel>> readDB()
  async {
    database = await checkDB();

    String Query = "SELECT * FROM news1";
    List<Map> l1 = await database!.rawQuery(Query);

    List<DataModel> download = l1.map((e) => DataModel().fromJson(e)).toList();
    return download;
  }

  Future<void> deletDB({required id})
  async {
    database = await checkDB();

    database!.delete("news1",whereArgs: [id],where: "id = ?");

  }
}
