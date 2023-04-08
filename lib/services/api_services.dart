import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../models/nodemodel.dart';

class ApiService {

  static String _baseUrl = "https://peaceful-oasis-30333.herokuapp.com/notes";

  static Future<void> addNode(Note note) async{  // so we use without making its instance
    Uri requestUri = Uri.parse(_baseUrl + "/add");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async{  // so we use without making its instance
    Uri requestUri = Uri.parse(_baseUrl + "/delete");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> updateNote(Note note) async{  // so we use without making its instance
    Uri requestUri = Uri.parse(_baseUrl + "/update");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Note>> fetchNotes(String userid) async {
    Uri requestUri = Uri.parse(_baseUrl + "/list");
    var response = await http.post(requestUri, body: {"userid":userid});
    var decoded = jsonDecode(response.body);
    // log(decoded.toString());
    // return[];
    List<Note> newNote = [];
    for (var notemap in decoded ){
      Note newNoteMap = Note.fromMap(notemap);
      newNote.add(newNoteMap);
    }
    return newNote;
  }
  
}