import 'package:building_app/view/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import '../shapes.dart';

class BottomSheetCard extends StatelessWidget {
  final List<Widget> children;
  final String? label;

  const BottomSheetCard({super.key, required this.children, this.label});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: AppShapes.roundedRectangleShape,
          color: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: AppShapes.borderRadius,
                  color: Theme.of(context).hintColor.withOpacity(0.4),
                ),
              ),
              label != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        label!,
                        style: TextStyle(color: Theme.of(context).hintColor, fontSize: 14),
                      ),
                    )
                  : const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
              const SizedBox(height: 10)
            ]),
          ))
    ]);
  }
}

class ManageNoteBottomSheet extends StatefulWidget {
  final String title;
  final String text;

  const ManageNoteBottomSheet({
    super.key,
    this.title = "",
    this.text = "",
  });

  @override
  State<StatefulWidget> createState() => ManageNoteBottomSheetState();
}

class ManageNoteBottomSheetState extends State<ManageNoteBottomSheet> {
  String _title = "";
  String _text = "";

  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _title = widget.title;
    _text = widget.text;

    _titleController.text = _title;
    _textController.text = _text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          BottomSheetCard(
            label: "Новое событие",
            children: [
              Text(
                "Заголовок",
                style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
              ),
              SizedBox(height: 4),
              AppTextField(
                hint: "",
                onChanged: (value) {
                  _title = value;
                },
                controller: _titleController,
              ),
              SizedBox(height: 8),
              Text(
                "Текст",
                style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
              ),
              SizedBox(height: 4),
              AppTextField(
                hint: "",
                onChanged: (value) {
                  _text = value;
                },
                controller: _textController,
                inputType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Добавить"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
