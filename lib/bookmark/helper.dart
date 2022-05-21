import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //import these

import 'news_model.dart';

class DBHelper {
  //this is to initialize the SQLite database
  //Database is from sqflite package
  //as well as getDatabasesPath()
  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contacts.db');
    //this is to create database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //build _onCreate function
  static Future _onCreate(Database db, int version) async {
    //this is to create table into database
    //and the command is same as SQL statement
    //you must use ''' and ''', for open and close
    final sql = '''CREATE TABLE contacts(
      id INTEGER PRIMARY KEY,
      name TEXT,
      contact TEXT
    )''';
    //sqflite is only support num, string, and unit8List format
    //please refer to package doc for more details
    await db.execute(sql);
  }

  //build create function (insert)
  static Future<int> saveNews(NewsModel contact) async {
    Database db = await DBHelper.initDB();
    //create contact using insert()
    return await db.insert('contacts', contact.toJson());
  }

  //build read function
  static Future<List<NewsModel>> readNews() async {
    Database db = await DBHelper.initDB();
    var contact = await db.query('contacts', orderBy: 'name');
    //this is to list out the contact list from database
    //if empty, then return empty []
    List<NewsModel> contactList = contact.isNotEmpty
        ? contact.map((details) => NewsModel.fromJson(details)).toList()
        : [];
    return contactList;
  }

  //build update function


  //build delete function
  static Future<int> deleteNews(int id) async {
    Database db = await DBHelper.initDB();
    //delete existing contact
    //according to its id
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
