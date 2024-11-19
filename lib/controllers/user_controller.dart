import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/apis/services/profile_service.dart';
import 'package:pas1_mobile_11pplg2_24/models/user_model.dart';
import 'package:pas1_mobile_11pplg2_24/utils/database.dart';
import 'package:sqflite/sqflite.dart';

class UserController extends GetxController {
  static Database? _db;

  Rx<UserModel?> user = Rx<UserModel?>(null);
  Rx<bool> isLoading = true.obs;

  // Get database object
  Future<Database?> get db async {
    // Initialize the database
    _db ??= await initDB('user', (db, version) async {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS current_user (
          username TEXT PRIMARY KEY,
          email TEXT,
          full_name TEXT
        )
      ''');
    });

    return _db;
  }

  // Get user data (from database)
  Future<UserModel?> getUser() async {
    var dbClient = await db;
    var res = await dbClient!.query('current_user');
    var result = res.isNotEmpty ? UserModel.fromMap(res.first) : null;
    user.value = result;
    isLoading.value = false;
    return result;
  }

  // Fetch user data (from API)
  Future<UserModel?> fetchUser(String token) async {
    var user = await ProfileService.fetchUser(token);
    this.user.value = user;
    isLoading.value = false;

    saveUser(user);
    return user;
  }

  // Save user data to database
  Future<void> saveUser(UserModel user) async {
    var dbClient = await db;
    await dbClient!.delete('current_user');
    await dbClient.insert('current_user', {
      'username': user.username,
      'email': user.email,
      'full_name': user.fullName
    });
  }

  // Remove user data from database (logout)
  Future<void> removeUser() async {
    var dbClient = await db;
    await dbClient!.delete('current_user');
  }
}
