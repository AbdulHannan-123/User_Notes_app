import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nodeapplication/models/nodemodel.dart';
import 'package:nodeapplication/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewPage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewPage({super.key, required this.isUpdate, this.note});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();

  FocusNode notefocus = FocusNode();



  void addNewNode(){
    Note newNote=Note(
      id:const Uuid().v1(),
      userid: "Abdul Hannan",
      title: titlecontroller.text,
      content: contentcontroller.text,
      dateadded: DateTime.now()
    ); 

    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote(){
    widget.note!.title = titlecontroller.text;
              widget.note!.content = contentcontroller.text;
              Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
              Navigator.pop(context);
  }


  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      titlecontroller.text = widget.note!.title!;
      contentcontroller.text = widget.note!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            if (widget.isUpdate) {
              updateNote();
            } else {
              addNewNode();
            }
          }, icon:const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             TextField(
              controller: titlecontroller,
              autofocus: widget.isUpdate?false : true,  
              style:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              decoration:const InputDecoration(
                hintText: "Title"
              ),
              onSubmitted: (value) {
                if (value != "") {
                  notefocus.requestFocus();
                }
              },
            ),
      
            Expanded(
              child: TextField(
                focusNode: notefocus,
                controller: contentcontroller,
                maxLines: null,
                style:const TextStyle(
                  fontSize: 20,
                ),
                decoration:const InputDecoration(
                  hintText: "Note"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}