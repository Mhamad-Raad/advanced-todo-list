//! This is file is meant for the second screen, i.e., NoteScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';

// import '../models/note.dart';

class NoteScreen extends StatelessWidget {
  bool editable;
  int index;
  String tempTitle, tempContent;

  NoteScreen(this.editable, this.index);

  Widget build(BuildContext context) {
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
      body: editable
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: null,
                    enabled: true,
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
                        enabled: true,
                        initialValue: null,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: 'Type the description',
                        ),
                        onChanged: (value) {
                          tempContent = value;
                        }),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
