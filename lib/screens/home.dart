import 'package:floor_db/database/note_table.dart';
import 'package:floor_db/database/notedao.dart';
import 'package:floor_db/screens/add_screen.dart';
import 'package:floor_db/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final NoteDao noteDao = Get.find();

  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: widget.noteDao.getAllNotes() != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Dear, there are your list to do ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                ],
              )
            : Text("Oh! You do have any notes"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: noteList(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        heroTag: "Add",
        onPressed: () {
          Get.to(AddScreen());
        },
        icon: Icon(Icons.add),
        label: Text("add"),
      ),
    );
  }

  Widget noteList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: StreamBuilder<List<Note>>(
        stream: widget.noteDao.getAllNotes(),
        builder: (_, data) {
          if (!data.hasData) {
            return Container(
              child: Center(
                child: Icon(Icons.sentiment_very_dissatisfied,
                    size: 100, color: Colors.red),
              ),
            );
          }
          if (data.hasData) {
            return ListView.builder(
              itemBuilder: (_, position) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(UpdateScreen(), arguments: data.data![position]);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        widget.noteDao.deleteNote(data.data![position]);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    title: Text(data.data![position].title),
                    subtitle: Text(data.data![position].message),
                  ),
                );
              },
              itemCount: data.data!.length,
            );
          }
          if (data.hasError) {
            return Text('ERROR');
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
