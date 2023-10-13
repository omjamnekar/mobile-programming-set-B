import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:database/student.dart';

class DBHelper {
  static Database? myDB;

  Future<Database?> get db async {
    if (myDB != null) return myDB;
    myDB = await initDB();
    return myDB;
  }

  Future<Database?> initDB() async {
    io.Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'student.db');

    var db = await openDatabase(path, version: 1, onCreate: createDB);
    return db;
  }

  void createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE student(id INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT NOT NULL, rno INTEGER NOT NULL, address TEXT NOT NULL)');
  }

  Future<StudentModel> ins(StudentModel sm) async {
    var myDB = await db; // Use DBHelper().db to get the database instance
    await myDB!.insert('student', sm.toMap());
    return sm;
  }

  Future<List<StudentModel>> getStudent() async {
    var myDB = await db; // Use DBHelper().db to get the database instance
    final List<Map<String, Object?>> res = await myDB!.query('student');

    return res.map((e) => StudentModel.fromMap(e)).toList()
      ..sort((a, b) => (a.rno as int).compareTo(b.rno as int));
  }

  Future<int> del(int id) async {
    var myDB = await db; // Use DBHelper().db to get the database instance
    return await myDB!.delete('student', where: 'id=?', whereArgs: [id]);
  }

  Future<int> upd(StudentModel sm) async {
    var myDB = await db; // Use DBHelper().db to get the database instance
    return await myDB!
        .update('student', sm.toMap(), where: 'id =?', whereArgs: [sm.id]);
  }
}
