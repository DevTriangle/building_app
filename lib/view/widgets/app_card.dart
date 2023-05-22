import 'package:building_app/model/builder_group.dart';
import 'package:building_app/view/shapes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/building.dart';
import '../../model/material.dart';
import '../../model/note.dart';

class BuildingCard extends StatelessWidget {
  final Building building;
  final Function() onTap;

  const BuildingCard({super.key, required this.building, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: AppShapes.roundedRectangleShape,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: CachedNetworkImageProvider(building.image),
              width: MediaQuery.of(context).size.width * 0.5 - 32,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    building.label,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Кол-во комнат: ${building.roomCount}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Площадь: ${building.square} м2",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MaterialCard extends StatelessWidget {
  final AppMaterial material;
  final Function() onTap;

  const MaterialCard({super.key, required this.material, required this.onTap});

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
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 94,
                child: Text(
                  material.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.bookmark_outline_rounded,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 64,
                    child: Text(
                      note.text.length <= 200 ? note.text : "${note.text.substring(0, 200)}...",
                      style: TextStyle(fontSize: 14),
                      softWrap: true,
                    ),
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

class BuilderGroupCard extends StatelessWidget {
  final BuilderGroup builderGroup;
  final Function() onTap;

  const BuilderGroupCard({
    super.key,
    required this.builderGroup,
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
              Icon(
                Icons.group_outlined,
                size: 48,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      builderGroup.name,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      softWrap: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Количество строителей: ${builderGroup.count}",
                      style: TextStyle(fontSize: 14),
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
