//! This is file is meant for the first screen, i.e., ListScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';

import 'note_screen.dart';

// import 'note_screen.dart';
// import '../models/note.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool hide = false;
  List<bool> shows = [false, false, false, false];

  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < noteList.length; i++) {
      noteList[i].getTitle();
      noteList[i].getContent();
    }

    // ignore: unnecessary_new
    Timer timer =
        new Timer.periodic(new Duration(seconds: 2), (Timer timer) async {
      // ignore: unnecessary_this
      this.setState(() {
        for (var i = 0; i < noteList.length; i++) {
          noteList[i].getTitle();
          noteList[i].getContent();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              noteList.length.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        key: UniqueKey(),
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemCount: noteList.length,
        itemBuilder: (context, index) => ListTile(
          key: UniqueKey(),
          trailing: shows[index]
              ? SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteScreen(true, index, false),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            noteList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          title: Text(noteList[index].getTitle() ?? "null"),
          subtitle:
              hide ? Text("") : Text(noteList[index].getContent() ?? "null"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteScreen(false, index, false)));
          },
          onLongPress: () {
            setState(() {
              shows[index] = !shows[index];
              // print(noteList[index].title);
            });
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: hide ? Icon(Icons.list) : Icon(Icons.unfold_less),
              tooltip: 'Show less. Hide notes content',
              onPressed: () {
                setState(() {
                  hide = !hide;
                });
              }),
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(true, 0, true),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
