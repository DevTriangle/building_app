import 'package:building_app/model/note.dart';
import 'package:building_app/view/widgets/note_card.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<StatefulWidget> createState() => NotesScreenState();
}

class NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [
    Note("title", "text"),
    Note("title", "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Заметки",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        body: notes.isNotEmpty
            ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (itemBuilder, index) {
                  return NoteCard(note: notes[index], onTap: () {});
                },
              )
            : Center(
                child: Text(
                  "Заметок нет.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    );
  }
}