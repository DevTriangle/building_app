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
          shape: AppShapes.roundedRectangleShape,
          color: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
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
                      style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.7), fontSize: 14),
                    ),
                  )
                : const SizedBox(height: 10),
            Column(
              children: children,
            ),
            const SizedBox(height: 10)
          ]))
    ]);
  }
}

class ManageNoteBottomSheet extends StatefulWidget {
  const ManageNoteBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() => ManageNoteBottomSheetState();
}

class ManageNoteBottomSheetState extends State<ManageNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(children: []);
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
              child: Text("Сохранить"),
            )
          ],
        ),
      ],
    );
  }
}
