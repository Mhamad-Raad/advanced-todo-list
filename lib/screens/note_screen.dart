//! This is file is meant for the second screen, i.e., NoteScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';
import 'package:midterm/models/note.dart';

import 'list_screen.dart';

// import '../models/note.dart';

class NoteScreen extends StatelessWidget {
  bool editable, add;
  int index;

  NoteScreen(this.editable, this.index, this.add);

  Widget build(BuildContext context) {
    String tempTitle = noteList[index].title,
        tempContent = noteList[index].content;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text('Note Screen App Bar Title'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.check_circle,
                size: 30,
              ),
              onPressed: () {
                if (add) {
                  noteList.add(Note(tempTitle, tempContent));
                  print(noteList.length);
                } else {
                  noteList[index].setTitle(tempTitle);
                  noteList[index].setContent(tempContent);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen(),
                  ),
                );
              }),
          IconButton(
              icon: Icon(
                Icons.cancel_sharp,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: add ? "" : noteList[index].title,
              enabled: editable,
              decoration: InputDecoration(
                hintText: 'Type the title here',
              ),
              onChanged: (value) {
                tempTitle = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextFormField(
                enabled: editable,
                initialValue: add ? "" : noteList[index].content,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Type the description',
                ),
                onChanged: (value) {
                  tempContent = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
