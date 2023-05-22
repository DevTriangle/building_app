import 'package:building_app/model/note.dart';
import 'package:building_app/viewmodel/notes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bottom_sheet.dart';
import '../widgets/app_card.dart';
import 'info_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<StatefulWidget> createState() => NotesScreenState();
}

class NotesScreenState extends State<NotesScreen> {
  late NotesViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = Provider.of<NotesViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (builder) {
                return ManageNoteBottomSheet(
                  onSave: (note, _) async {
                    viewModel.notes.add(note);

                    await viewModel.saveNotes();

                    setState(() {});

                    Navigator.pop(context);
                  },
                  onRemove: () {},
                );
              },
            );
          },
          child: Icon(Icons.add_rounded),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Заметки",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const InfoScreen()));
                },
                icon: const Icon(Icons.info_rounded),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: viewModel.loadNotes(),
          builder: (fContext, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: viewModel.notes.length,
                itemBuilder: (itemBuilder, index) {
                  return NoteCard(
                    note: viewModel.notes[index],
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (builder) {
                          return ManageNoteBottomSheet(
                            title: viewModel.notes[index].title,
                            text: viewModel.notes[index].text,
                            isEditing: true,
                            onSave: (note, isEditing) async {
                              if (isEditing) {
                                viewModel.notes.removeAt(index);
                                viewModel.notes.insert(index, note);
                              } else {
                                viewModel.notes.add(note);
                              }

                              await viewModel.saveNotes();

                              setState(() {});

                              Navigator.pop(context);
                            },
                            onRemove: () async {
                              viewModel.notes.removeAt(index);

                              await viewModel.saveNotes();

                              setState(() {});

                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  "Заметок нет.",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
