import 'package:building_app/model/note.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bottom_sheet.dart';
import '../widgets/app_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<StatefulWidget> createState() => NotesScreenState();
}

class NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [
    Note("title", "text"),
    Note("title", "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"),
    Note("title",
        "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return ManageNoteBottomSheet();
                });
          },
          child: Icon(Icons.add_rounded),
        ),
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
            : const Center(
                child: Text(
                  "Заметок нет.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    );
  }
}
