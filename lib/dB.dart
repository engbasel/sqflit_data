import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQL_db_Model {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialdb();
      return _db;
    } else {
      return _db;
    }
  }

  initialdb() async {
    String databasepath = await getDatabasesPath();
    String Final_Path = join(databasepath, 'basel.db');
    Database mydb = await openDatabase(Final_Path,
        onCreate: OnCreate_Method, version: 3, onUpgrade: OnUpgrade_Method);
    return mydb;
  }

  OnUpgrade_Method(Database db, int OldVersion, int NewVersion) {
    print(' =========  OnUpgrade_Method    =========');
  }

  OnCreate_Method(Database db, int version) async {
    await db.execute('''
CREATE TABLE "notes_table" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
note TEXT NULL NULL
  )
''');
    print(' =========  Created Database  ====  OnCreate_Method  =========');
  }

  readData(String sql) async {
    Database? mydb = await db;
    Future<List<Map>> respons = mydb!.rawQuery(sql);
    return respons;
  }

  InsertData(String sql) async {
    Database? mydb = await db;
    Future<int> respons = mydb!.rawInsert(sql);
    return respons;
  }

  UpdateData(String sql) async {
    Database? mydb = await db;
    Future<int> respons = mydb!.rawUpdate(sql);

    return respons;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    Future<int> respons = mydb!.rawDelete(sql);
    return respons;
  }
}

String TABLENAME = 'notes_table';
