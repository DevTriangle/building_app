import 'package:building_app/view/colors.dart';
import 'package:building_app/view/widgets/app_bottom_sheet.dart';
import 'package:building_app/view/widgets/app_card.dart';
import 'package:building_app/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes_screen.dart';

class RBuildingsScreen extends StatefulWidget {
  const RBuildingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => RBuildingsScreenState();
}

class RBuildingsScreenState extends State<RBuildingsScreen> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                context: context,
                builder: (b) {
                  return ManageBuildingBottomSheet();
                });
          },
          child: const Icon(Icons.add_rounded),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const Text(
                "Готовые постройки",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: viewModel.buildings.length,
                itemBuilder: (b, index) {
                  return BuildingCard(
                    building: viewModel.buildings[index],
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => const NotesScreen()));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
