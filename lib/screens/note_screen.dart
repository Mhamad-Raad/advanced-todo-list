//! This is file is meant for the second screen, i.e., NoteScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';

// import '../models/note.dart';

class NoteScreen extends StatelessWidget {
  bool editable;
  int index;

  NoteScreen(this.editable, this.index);

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
                noteList[index].setTitle(tempTitle);
                noteList[index].setContent(tempContent);
                print(noteList[index].title);
                Navigator.pop(context);
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
              initialValue: noteList[index].title,
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
                initialValue: noteList[index].content,
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
