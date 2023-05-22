import 'package:building_app/view/shapes.dart';
import 'package:flutter/material.dart';

class BuildingsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;

  const BuildingsButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: AppShapes.roundedRectangleShape,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    icon,
                    size: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
