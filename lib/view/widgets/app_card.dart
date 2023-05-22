import 'package:building_app/view/shapes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/building.dart';

class BuildingCard extends StatelessWidget {
  final Building building;
  final Function() onTap;

  const BuildingCard({super.key, required this.building, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
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
                      fontSize: 16,
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
