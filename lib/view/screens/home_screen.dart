import 'package:building_app/view/colors.dart';
import 'package:building_app/view/screens/buildings_screen.dart';
import 'package:flutter/material.dart';

import 'builder_group_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const BuildingsScreen(),
    const BuilderGroupListScreen(),
  ];
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedScreen],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 2,
            currentIndex: _selectedScreen,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            onTap: (value) {
              _selectedScreen = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Строительные сооружения",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_rounded),
                label: "Список строителей",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
