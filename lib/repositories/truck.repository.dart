import 'package:fixgreen/models/truck.model.dart';
import 'package:fixgreen/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TruckRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_TRUCK_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future create(TruckModel model) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_NAME_PERSON,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch(ex) {
      print(ex);
      return;
    }
  }

  Future<List<TruckModel>?> getTrucks() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME_PERSON);

      return List.generate(
        maps.length,
        (i) {
          return TruckModel(
            id: maps[i]['id'],
            model: maps[i]['model'],
            brand: maps[i]['brand'],
            plate: maps[i]['plate'],
            year: maps[i]['year'],
            fuel: maps[i]['fuel'],
            averageKm: maps[i]['averageKm'],
            carbonKm: maps[i]['carbonKm'],
          );    
        }
      );
    } catch(ex) {
      print(ex);
      return null;
    }
  }

  Future<List<TruckModel>?> search(String term) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME_PERSON,
        where: "name LIKE ?",
        whereArgs: [
          '%$term%',
        ],
      );
      
      return List.generate(
        maps.length,
        (i) {
          return TruckModel(
            id: maps[i]['id'],
            model: maps[i]['model'],
            brand: maps[i]['brand'],
            plate: maps[i]['plate'],
            year: maps[i]['year'],
            fuel: maps[i]['fuel'],
            averageKm: maps[i]['averageKm'],
            carbonKm: maps[i]['carbonKm'],
          );  
        }
      );
    } catch(ex) {
      print(ex);
      List<TruckModel>? list = null;
      return list;
    }
  }

  Future<TruckModel> getTruck(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME_PERSON,
        where: "id = ?",
        whereArgs: [id],
      );

      return TruckModel(
        id: maps[0]['id'],
        model: maps[0]['model'],
        brand: maps[0]['brand'],
        plate: maps[0]['plate'],
        year: maps[0]['year'],
        fuel: maps[0]['fuel'],
        averageKm: maps[0]['averageKm'],
        carbonKm: maps[0]['carbonKm'],
      );
    } catch (ex) {
      print(ex);
      return new TruckModel();
    }
  }

  Future update(TruckModel model) async {
    try {
      final Database db = await _getDatabase();

      db.update(
        TABLE_NAME_TRUCK,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
      } catch (ex) {
      print(ex);
      return new TruckModel();
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await _getDatabase();
      
      await db.delete(
        TABLE_NAME_TRUCK,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return new TruckModel();
    }
  }
}