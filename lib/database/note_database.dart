import 'package:floor/floor.dart';
import 'package:floor_db/database/note_table.dart';
import 'package:floor_db/database/notedao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
