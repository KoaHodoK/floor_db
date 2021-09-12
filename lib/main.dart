import 'package:floor_db/database/note_database.dart';
import 'package:floor_db/database/notedao.dart';
import 'package:floor_db/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data) {
          if (data.hasData) {
            return Home(data.data!.noteDao);
          }
          if (data.hasError) {
            return Container(child: Center(child: Text('ERROR')));
          }
          return Container(child: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
