import 'package:building_app/view/screens/materials_screen.dart';
import 'package:building_app/view/screens/r_buildings_screen.dart';
import 'package:building_app/view/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_screen.dart';

class BuildingsScreen extends StatefulWidget {
  const BuildingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => BuildingsScreenState();
}

class BuildingsScreenState extends State<BuildingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Строительные сооружения",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => InfoScreen()));
              },
              icon: const Icon(Icons.info_rounded),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildingsButton(
              icon: Icons.holiday_village_rounded,
              label: "Готовые постройки",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (b) => RBuildingsScreen()));
              },
            ),
            SizedBox(height: 16),
            BuildingsButton(
              icon: Icons.settings_rounded,
              label: "Выбрать материал",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (b) => MaterialsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
