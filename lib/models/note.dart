class NoteModel {
  String content;

  ///DateTime date;

  NoteModel(String s, {required this.content

      ///,required this.date
      });

  NoteModel.fromMap(Map map) : this.content = map['content'];
  // ,
  //this.date=map ['date'];

  Map toMap() {
    return {
      'content': this.content,

      ///'date': this.date
    };
  }
}
