import 'dart:math';

import 'package:building_app/model/builder_group.dart';
import 'package:building_app/model/material.dart';
import 'package:building_app/model/note.dart';
import 'package:building_app/view/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../model/building.dart';
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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

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
                    : const SizedBox(),
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
  final Building? building;
  final Function(Building) onSavePressed;
  final Function()? onDeletePressed;

  const ManageBuildingBottomSheet({
    super.key,
    this.building,
    required this.onSavePressed,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => ManageBuildingBottomSheetState();
}

class ManageBuildingBottomSheetState extends State<ManageBuildingBottomSheet> {
  final _name = TextEditingController();
  final _image = TextEditingController();
  final _roomCount = TextEditingController();
  final _square = TextEditingController();
  final _price = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.building != null) {
      _name.text = widget.building!.label;
      _image.text = widget.building!.image;
      _roomCount.text = widget.building!.roomCount.toString();
      _square.text = widget.building!.square.toString();
      _price.text = widget.building!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(
      label: widget.building != null ? "Редактирование постройки" : "Создание постройки",
      children: [
        Text(
          "Название",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _name,
        ),
        const SizedBox(height: 8),
        Text(
          "Изображение (url)",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _image,
        ),
        const SizedBox(height: 8),
        Text(
          "Кол-во комнат",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _roomCount,
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        Text(
          "Площадь",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _square,
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        Text(
          "Цена",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _price,
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.building != null
                ? TextButton(
                    onPressed: () {
                      widget.onDeletePressed!();
                    },
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error)),
                    child: const Text("Удалить"),
                  )
                : const SizedBox(),
            TextButton(
              onPressed: () {
                widget.onSavePressed(
                  Building(_name.text, _image.text, int.parse(_roomCount.text), double.parse(_square.text), double.parse(_price.text), false),
                );
              },
              child: const Text("Сохранить"),
            )
          ],
        ),
      ],
    );
  }
}

class ManageMaterialBottomSheet extends StatefulWidget {
  final AppMaterial? material;
  final Function(AppMaterial) onSavePressed;
  final Function()? onDeletePressed;

  const ManageMaterialBottomSheet({
    super.key,
    this.material,
    required this.onSavePressed,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => ManageMaterialBottomSheetState();
}

class ManageMaterialBottomSheetState extends State<ManageMaterialBottomSheet> {
  final _name = TextEditingController();
  final _price = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.material != null) {
      _name.text = widget.material!.name;
      _price.text = widget.material!.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(
      label: widget.material != null ? "Редактирование материала" : "Создание материала",
      children: [
        Text(
          "Название",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _name,
        ),
        Text(
          "Цена",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _price,
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.material != null
                ? TextButton(
                    onPressed: () {
                      widget.onDeletePressed!();
                    },
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error)),
                    child: const Text("Удалить"),
                  )
                : const SizedBox(),
            TextButton(
              onPressed: () {
                widget.onSavePressed(AppMaterial(Random().nextInt(9999999), _name.text, _price.text, false));
              },
              child: const Text("Сохранить"),
            )
          ],
        ),
      ],
    );
  }
}

class ManageBuildersBottomSheet extends StatefulWidget {
  final BuilderGroup? builderGroup;
  final Function(BuilderGroup) onSavePressed;
  final Function()? onDeletePressed;

  const ManageBuildersBottomSheet({
    super.key,
    this.builderGroup,
    required this.onSavePressed,
    this.onDeletePressed,
  });

  @override
  State<StatefulWidget> createState() => ManageBuildersBottomSheetState();
}

class ManageBuildersBottomSheetState extends State<ManageBuildersBottomSheet> {
  final _name = TextEditingController();
  final _count = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.builderGroup != null) {
      _name.text = widget.builderGroup!.name;
      _count.text = widget.builderGroup!.count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(
      label: widget.builderGroup != null ? "Редактирование бригады" : "Создание бригады",
      children: [
        Text(
          "Название",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _name,
        ),
        const SizedBox(height: 8),
        Text(
          "Кол-во строителей",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hint: "",
          onChanged: (value) {},
          controller: _count,
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.builderGroup != null
                ? TextButton(
                    onPressed: () {
                      widget.onDeletePressed!();
                    },
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error)),
                    child: const Text("Удалить"),
                  )
                : const SizedBox(),
            TextButton(
              onPressed: () {
                widget.onSavePressed(BuilderGroup(_name.text, int.parse(_count.text), false));
              },
              child: const Text("Сохранить"),
            )
          ],
        ),
      ],
    );
  }
}
