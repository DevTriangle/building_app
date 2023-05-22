import 'dart:convert';

import 'package:building_app/model/building.dart';
import 'package:building_app/model/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/builder_group.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Building> buildings = [];

  final List<AppMaterial> materials = [
    AppMaterial(0, "Кирпич"),
    AppMaterial(1, "Дерево"),
    AppMaterial(2, "Блок цементный фундаментный полнотелый"),
  ];

  final List<BuilderGroup> builderGroups = [
    BuilderGroup("Бригада №1", 2),
    BuilderGroup("Бригада №2", 4),
    BuilderGroup("Бригада №3", 7),
  ];

  Future<List<Building>> loadBuildings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? bJson = sharedPreferences.getString("buildings");
    if (bJson != null) {
      Iterable list = json.decode(bJson);

      buildings.addAll(List.from(list.map((e) => Building.fromJson(e))));
    }

    return buildings;
  }
}
