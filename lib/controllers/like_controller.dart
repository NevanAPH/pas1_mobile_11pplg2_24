import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_24/utils/database.dart';
import 'package:sqflite/sqflite.dart';

class LikeController extends GetxController {
  static Database? _db;
  RxList<Team> likes = <Team>[].obs;
  Rx<bool> isLoading = true.obs;

  Future<Database?> get db async {
    _db ??= await initDB('likes', (db, version) async {

      await db.execute('''
        CREATE TABLE IF NOT EXISTS likes (
          idTeam TEXT PRIMARY KEY,
          strTeam TEXT,
          strLeague TEXT,
          strBadge TEXT,
          strFacebook TEXT,
          strTwitter TEXT,
          strInstagram TEXT,
          strDescriptionEn TEXT
        )
      ''');
    });
    return _db;
  }

  // Add an item to likes
  Future<int> addLike(Team team) async {
    var dbClient = await db;
    int result = await dbClient!.insert('likes', team.toJson());
    loadLikes();
    return result;
  }

  // Load all like items
  Future<void> loadLikes() async {
    var dbClient = await db;
    List<Map<String, dynamic>> results = await dbClient!.query('likes');
    likes.assignAll(
      results.map((data) => Team.fromJson(data)).toList(),
    );
    isLoading.value = false;
  }

  // Remove an item from likes
  Future<void> removeLike(String idTeam) async {
    var dbClient = await db;
    await dbClient!
        .delete('likes', where: 'idTeam = ?', whereArgs: [idTeam]);
    loadLikes(); // Reload likes after removal
  }

  Future<void> toggleLike(Team item) async {
    if (isLiked(item)) {
      await removeLike(item.idTeam);
    } else {
      await addLike(item);
    }
  }

  bool isLiked(Team team) {
    return likes.any((like) => like.idTeam == team.idTeam);
  }
}
