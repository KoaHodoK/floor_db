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
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Update Note',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: Container(
        margin: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: title,
              decoration: InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: message,
              decoration: InputDecoration(
                  labelText: 'Message', border: OutlineInputBorder()),
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  noteDao
                      .updateNote(Note(title.text, message.text, id: note.id));
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ),
      ),
    );
  }
}
