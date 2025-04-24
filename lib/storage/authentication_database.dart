import 'package:comida_food_delivery_app/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDBHelper{
    static Database? _database;
    final String tableName = "users";
    Future<Database> get database async{
        if(_database != null) return _database!;
        _database = await _initDatabase();
        return _database!;
    }

    Future<Database> _initDatabase() async{
        String path = await getDatabasesPath();
        return openDatabase(join(path,'users.db'),version: 1,
            onCreate: (db,version) async{
                await db.execute("CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,email TEXT,pass TEXT)");
            });
    }

    Future<int> insertUser(UserModel user) async{
        final db = await database;
        return await db.insert(tableName, <String, Object?>{
            "name" : user.name,
            "email" : user.email,
            "pass" : user.pass
        });
    }

    Future<int> search(UserModel user) async {
        final db = await database;
        final result = await db.query(
            tableName,
            where: "name = ? AND pass = ?",
            whereArgs: [user.name, user.pass],
        );
        return result.isNotEmpty ? 1 : 0;
    }


    Future<List<Map>> getAll() async{
        final db = await database;
        return await db.query(tableName);
    }


    /*Future<int> get(int id) async{
        final db = await database;
        return await db.query(tableName,where: "id = ?",whereArgs: [id]);
    }*/

    Future<int> delete(int id) async{
        final db = await database;
        return await db.delete(tableName,where: "id = ?",whereArgs: [id]);
    }
}