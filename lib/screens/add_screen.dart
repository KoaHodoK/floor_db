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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text(
                'Add Note',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
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
                  onSubmitted: (val) =>
                      val.isEmpty ? "Title can\'t be empty" : val = title.text,
                  autofocus: true,
                  controller: title,
                  decoration: InputDecoration(
                      labelText: 'Title', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onSubmitted: (val) => val.isEmpty
                      ? "Message can\'t be empty"
                      : val = message.text,
                  controller: message,
                  decoration: InputDecoration(
                      labelText: 'Message', border: OutlineInputBorder()),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      noteDao.addNote(Note(title.text, message.text));
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ],
            ),
          )),
    );
  }
}
