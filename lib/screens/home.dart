import 'package:floor_db/database/note_table.dart';
import 'package:floor_db/database/notedao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  NoteDao noteDao;

  Home(this.noteDao);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floor database')),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await widget.noteDao.addNote(Note('Title', 'message'));
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
            child: Icon(Icons.remove),
          )
        ],
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
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      '${position + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
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
