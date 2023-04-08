import 'package:flutter/material.dart';
import 'package:nodeapplication/models/nodemodel.dart';
import 'package:nodeapplication/services/api_services.dart';

class NotesProvider with ChangeNotifier {
  
  List<Note> notes =[];
  bool isLoading = true;

  NotesProvider(){
    fetchNotes();
  }

  void sort(){
    notes.sort((a,b)=> b.dateadded!.compareTo(a.dateadded!));
  }

  void addNote(Note note) {
    notes.add(note);
    sort();
    notifyListeners();
    ApiService.addNode(note);
  }

  void updateNote(Note note) {
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sort();
    notifyListeners();
    ApiService.addNode(note);
  }

  void deleteNote(Note note) {
    int indexOfNote = notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    sort();
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes()async{
    notes = await ApiService.fetchNotes("Abdul Hannan");
    sort();
    isLoading = false;
    notifyListeners();
  }

}