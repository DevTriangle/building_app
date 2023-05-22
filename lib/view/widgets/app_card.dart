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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Ink.image(
              image: CachedNetworkImageProvider(building.image),
              width: 100,
              height: 100,
            ),
            Column(
              children: [
                Text(
                  building.label,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Кол-во комнат: ${building.roomCount}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Площадь: ${building.square} m2",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
