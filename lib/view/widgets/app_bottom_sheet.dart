import 'package:building_app/model/note.dart';
import 'package:building_app/view/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import '../shapes.dart';

class BottomSheetCard extends StatelessWidget {
  final List<Widget> children;
  final String? label;

  const BottomSheetCard({super.key, required this.children, this.label});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(children: [
          Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
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
                ]),
              ))
        ]),
      ),
    );
  }
}

class ManageNoteBottomSheet extends StatefulWidget {
  final String title;
  final String text;
  final Function(Note, bool) onSave;
  final Function() onRemove;
  final bool isEditing;

  const ManageNoteBottomSheet({
    super.key,
    this.title = "",
    this.text = "",
    required this.onSave,
    required this.onRemove,
    this.isEditing = false,
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
    return Wrap(
      children: [
        BottomSheetCard(
          label: widget.isEditing ? "Изменение события" : "Новое событие",
          children: [
            Text(
              "Заголовок",
              style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 4),
            AppTextField(
              hint: "",
              onChanged: (value) {
                _title = value;
              },
              controller: _titleController,
            ),
            const SizedBox(height: 8),
            Text(
              "Текст",
              style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 4),
            Container(
              constraints: const BoxConstraints(maxHeight: 150),
              child: AppTextField(
                hint: "",
                onChanged: (value) {
                  _text = value;
                },
                controller: _textController,
                inputType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLines: 1000,
                minLines: 1,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.isEditing
                    ? TextButton(
                        onPressed: () {
                          widget.onRemove();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Text(
                            "Удалить",
                            style: TextStyle(color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      )
                    : SizedBox(),
                TextButton(
                  onPressed: () {
                    widget.onSave(
                      Note(
                        _title.trim(),
                        _text.trim(),
                      ),
                      widget.isEditing,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(widget.isEditing ? "Изменить" : "Добавить"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ManageBuildingBottomSheet extends StatefulWidget {
  const ManageBuildingBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() => ManageBuildingBottomSheetState();
}

class ManageBuildingBottomSheetState extends State<ManageBuildingBottomSheet> {
  final _name = TextEditingController();
  final _roomCount = TextEditingController();
  final _square = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(
      label: "Создание постройки",
      children: [
        Text(
          "Название",
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).hintColor,
          ),
        ),
        AppTextField(
          hint: "",
          onChanged: () {},
          controller: _name,
        ),
        const SizedBox(height: 8),
        Text(
          "Кол-во комнат",
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).hintColor,
          ),
        ),
        AppTextField(
          hint: "",
          onChanged: () {},
          controller: _roomCount,
        ),
        const SizedBox(height: 8),
        Text(
          "Площадь",
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).hintColor,
          ),
        ),
        AppTextField(
          hint: "",
          onChanged: () {},
          controller: _square,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Сохранить"),
            )
          ],
        ),
      ],
    );
  }
}
