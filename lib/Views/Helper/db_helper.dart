import 'package:path/path.dart';
import 'package:quotes/Models/category.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {
  DB_helper._();

  static final DB_helper db = DB_helper._();
  static Database? database;

  Future initdb() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'quotes.db');
    database =
        await openDatabase(path, version: 1, onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS category(id INTEGER PRIMARY KEY,name TEXT, image BLOB)";
      await db.execute(query);
    });
  }

  Future<int?> insetcategory({required category data}) async {
    await initdb();
    String query = "INSERT INTO category(name,image) VALUES(?,?)";
    List args = [data.name, data.image];
    int? res = await database?.rawInsert(query, args);
    return res!;
  }
}
