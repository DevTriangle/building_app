import 'dart:convert';

import 'package:building_app/model/building.dart';
import 'package:building_app/model/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/builder_group.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Building> buildings = [];
  final List<AppMaterial> materials = [];
  final List<BuilderGroup> builderGroups = [];

  Future<List<Building>> loadBuildings() async {
    buildings.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? bJson = sharedPreferences.getString("buildings");
    if (bJson != null) {
      Iterable list = json.decode(bJson);

      buildings.addAll(List.from(list.map((e) => Building.fromJson(e))));
    }

    return buildings;
  }

  Future<void> saveBuildings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("buildings", jsonEncode(buildings.map((e) => e.toJson()).toList()));
  }

  Future<List<AppMaterial>> loadMaterials() async {
    materials.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? mJson = sharedPreferences.getString("materials");
    if (mJson != null) {
      Iterable list = json.decode(mJson);

      materials.addAll(List.from(list.map((e) => AppMaterial.fromJson(e))));
    }

    return materials;
  }

  Future<void> saveMaterials() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("materials", jsonEncode(materials.map((e) => e.toJson()).toList()));
  }

  Future<List<BuilderGroup>> loadBuilders() async {
    builderGroups.clear();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? mJson = sharedPreferences.getString("builderGroups");
    if (mJson != null) {
      Iterable list = json.decode(mJson);

      builderGroups.addAll(List.from(list.map((e) => BuilderGroup.fromJson(e))));
    }

    return builderGroups;
  }

  Future<void> saveBuilders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString("builderGroups", jsonEncode(builderGroups.map((e) => e.toJson()).toList()));
  }
}
