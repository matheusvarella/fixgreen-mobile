import 'package:fixgreen/models/person.model.dart';
import 'package:fixgreen/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_PERSON_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future create(PersonModel model) async {
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

  Future<List<PersonModel>?> getPersons() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME_PERSON);

      return List.generate(
        maps.length,
        (i) {
          return PersonModel(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
            latLng: maps[i]['latLng'],
          );    
        }
      );
    } catch(ex) {
      print(ex);
      return null;
    }
  }

  Future<List<PersonModel>?> search(String term) async {
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
          return PersonModel(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
            latLng: maps[i]['latLng'],
          );    
        }
      );
    } catch(ex) {
      print(ex);
      List<PersonModel>? list = null;
      return list;
    }
  }

  Future<PersonModel> getPerson(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME_PERSON,
        where: "id = ?",
        whereArgs: [id],
      );

      return PersonModel(
        id: maps[0]['id'],
        name: maps[0]['name'],
        phone: maps[0]['phone'],
        email: maps[0]['email'],
        image: maps[0]['image'],
        addressLine1: maps[0]['addressLine1'],
        addressLine2: maps[0]['addressLine2'],
        latLng: maps[0]['latLng'],
      ); 
    } catch (ex) {
      print(ex);
      return new PersonModel();
    }
  }

  Future update(PersonModel model) async {
    try {
      final Database db = await _getDatabase();

      db.update(
        TABLE_NAME_PERSON,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
      } catch (ex) {
      print(ex);
      return new PersonModel();
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await _getDatabase();
      
      await db.delete(
        TABLE_NAME_PERSON,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return new PersonModel();
    }
  }

    Future updateImage(int id, String imagePath) async {
    try {
      final Database db = await _getDatabase();
      final model = await getPerson(id);

      model.image = imagePath;

      db.update(
        TABLE_NAME_PERSON,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return new PersonModel();
    }
  }
}