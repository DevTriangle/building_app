import 'package:flutter/material.dart';

import '../../model/note.dart';
import '../shapes.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function() onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: AppShapes.roundedRectangleShape,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    note.text.length <= 200 ? note.text : "${note.text.substring(0, 200)}...",
                    style: TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
