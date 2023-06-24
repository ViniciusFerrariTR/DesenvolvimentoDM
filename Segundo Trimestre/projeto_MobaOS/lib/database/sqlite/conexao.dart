
import 'dart:async';
import 'package:path/path.dart';
import 'package:projeto_um/database/sqlite/scriptbd.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  
      deleteDatabase(path);                                    
      _database = await openDatabase(                  
        path,                                          
        version: 1,                                    
        onCreate: (db, v){                             
          criarOrcamento.forEach(db.execute);
          insercoesOrcamentos.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
}
  




