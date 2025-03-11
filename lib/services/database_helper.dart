import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todoapp.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        categoryId INTEGER,
        isCompleted INTEGER,
        FOREIGN KEY(categoryId) REFERENCES categories(id)
      )
    ''');
  }

  // Métodos para usuarios
  Future<int> registerUser(String email, String password) async {
    final db = await database;
    return await db.insert('users', {
      'email': email,
      'password': password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Métodos para categorías
  Future<int> createCategory(String name) async {
    final db = await database;
    return await db.insert('categories', {
      'name': name,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await database;
    return await db.query('categories');
  }

  Future<int> updateCategory(int id, String name) async {
    final db = await database;
    return await db.update(
      'categories',
      {'name': name},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  // Métodos para tareas
  Future<int> createTask(
    String title,
    String description,
    int categoryId,
  ) async {
    final db = await database;
    return await db.insert('tasks', {
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'isCompleted': 0,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query('tasks');
  }

  Future<int> updateTask(
    int id,
    String title,
    String description,
    int isCompleted,
  ) async {
    final db = await database;
    return await db.update(
      'tasks',
      {'title': title, 'description': description, 'isCompleted': isCompleted},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
