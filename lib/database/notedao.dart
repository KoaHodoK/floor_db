import 'package:floor/floor.dart';
import 'package:floor_db/database/note_table.dart';

@dao
abstract class NoteDao {
  @Query('select * from note')
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> addNote(Note note);
}
