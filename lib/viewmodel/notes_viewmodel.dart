import 'dart:convert';

import 'package:building_app/model/note.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesViewModel extends ChangeNotifier {
  final List<Note> notes = [];

  Future<List<Note>> loadNotes() async {
    notes.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? nJson = sharedPreferences.getString("notes");

    if (nJson != null) {
      Iterable list = json.decode(nJson);

      notes.addAll(List.from(list.map((e) => Note.fromJson(e))));
    }

    return notes;
  }

  Future<List<Note>> saveNotes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String nJson = jsonEncode(notes.map((e) => e.toJson()).toList());

    await sharedPreferences.setString("notes", nJson);

    return notes;
  }
}
