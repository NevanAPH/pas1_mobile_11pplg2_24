import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Initialize the database
// onCreate: function to call when the database is successfully created

Future<Database> initDB(
  String databaseName,
  Function(Database, int) onCreate
) async {
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, 'pas_mobile_$databaseName.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: onCreate,
  );
}