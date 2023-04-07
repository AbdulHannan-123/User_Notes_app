class Note{
  String? id;
  String? userid;
  String? title;
  String? content;
  DateTime? dateadded;

  Note({this.id,this.userid, this.title, this.content, this.dateadded});

  factory Note.fromMap(Map<String, dynamic> map) {    // its a factory contructor
    return Note(
      id: map["id"],
      userid: map["userid"],
      title: map["title"],
      content: map["content"],
      dateadded: DateTime.tryParse(map["dateadded"]),

    );
  }

  // more fuction

  Map<String, dynamic> toMap(){
    return {};
  }

}