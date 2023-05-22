import 'package:building_app/model/building.dart';
import 'package:building_app/model/material.dart';
import 'package:flutter/material.dart';

import '../model/builder_group.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Building> buildings = [
    Building("label", "https://cud.news/wp-content/uploads/2022/04/cud_news-panel.jpg", 3, 42, 939393),
    Building("label", "https://cud.news/wp-content/uploads/2022/04/cud_news-panel.jpg", 3, 42, 939393),
    Building("label", "https://cud.news/wp-content/uploads/2022/04/cud_news-panel.jpg", 3, 42, 939393),
    Building("label", "https://cud.news/wp-content/uploads/2022/04/cud_news-panel.jpg", 3, 42, 939393),
  ];

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
}
