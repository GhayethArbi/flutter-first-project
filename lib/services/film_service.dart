import 'package:first_flutter_project/sqflite/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/film.dart'; // Adjust the path based on your project structure

class FilmService {
  final String tableName = 'film';

  /// Insert a Film into the database
  Future<void> insertFilm(Film film) async {
    final db = await DatabaseHelper().database;
    await db.insert(
      tableName,
      film.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Fetch all Films from the database
  Future<List<Film>> fetchFilms() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert List<Map<String, dynamic>> to List<Film>
    return List.generate(maps.length, (i) {
      return Film.fromJson(maps[i]);
    });
  }

  /// Delete a Film by its ID
  Future<void> deleteFilm(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
