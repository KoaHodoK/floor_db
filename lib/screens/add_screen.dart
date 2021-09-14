import 'package:floor_db/database/note_table.dart';
import 'package:floor_db/database/notedao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Add Screen')),
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
                  noteDao.addNote(Note(title.text, message.text));
                  Get.back();
                },
                child: Text('Add Note'))
          ],
        ),
      ),
    );
  }
}
