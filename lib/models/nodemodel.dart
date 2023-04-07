class Note{
  String? id;
  String? userid;
  String? title;
  String? content;
  DateTime? dateadded;

  Note({this.id,this.userid, this.title, this.content, this.dateadded});


  // factory  jo ha wo map ko get krny k leay use krty hain

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
  // value the object ko return krnay k leay use kraty hain

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "userid": userid,
      "title": title,
      "content": content,
      "dateadded": dateadded!.toIso8601String(),
    };
  }

}