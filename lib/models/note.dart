//! Define the model class Note here

class Note {
  String title;
  String content;

  Note(String t, String c) {
    title = t;
    content = c;
  }

  String getTitle() {
    return title;
  }

  String getContent() {
    return content;
  }
}
