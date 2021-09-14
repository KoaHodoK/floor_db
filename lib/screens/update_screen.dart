import 'package:floor_db/database/note_table.dart';
import 'package:floor_db/database/notedao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    title.text = note.title;
    message.text = note.message;
    return Scaffold(
      appBar: AppBar(title: Text('Update Screen')),
      body: Container(
        margin: EdgeInsets.all(13),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                  hintText: 'Title', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: message,
              decoration: InputDecoration(
                  hintText: 'Message', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  noteDao
                      .updateNote(Note(title.text, message.text, id: note.id));
                  Get.back();
                },
                child: Text('Update Note'))
          ],
        ),
      ),
    );
  }
}
