import 'package:comida_food_delivery_app/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/meal_model.dart';

class CartDBHelper{
  static Database? _database;
  final String tableName = "carts";
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async{
    String path = await getDatabasesPath();
    return openDatabase(join(path,'cart.db'),version: 1,
        onCreate: (db,version) async{
          await db.execute("CREATE TABLE $tableName(id TEXT, name TEXT,image TEXT,desc TEXT)");
        });
  }

  Future<int> insert(MealModel meal) async{
    final db = await database;
    return await db.insert(tableName, <String, Object?>{
      "image" : meal.image,
      "name" : meal.mealName,
      "id" : meal.mealId,
      "desc":meal.mealDesc
    });
  }

  Future<List<MealModel>> getAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return MealModel(
        mealId: maps[i]['id'],
        mealName: maps[i]['name'],
        image: maps[i]['image'],
        mealDesc: maps[i]['desc'],
      );
    });
  }

  Future<int> delete(String id) async{
    final db = await database;
    return await db.delete(tableName,where: "id = ?",whereArgs: [id]);
  }
}