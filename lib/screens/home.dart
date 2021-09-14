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
      appBar: AppBar(title: Text('Floor database')),
      body: noteList(),
      floatingActionButton: FloatingActionButton(
        heroTag: "Add",
        onPressed: () {
          Get.to(AddScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: widget.noteDao.getAllNotes(),
      builder: (_, data) {
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
        return CircularProgressIndicator();
      },
    );
  }
}
