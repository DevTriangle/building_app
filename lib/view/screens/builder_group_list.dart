import 'package:building_app/view/screens/notes_screen.dart';
import 'package:building_app/view/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home_viewmodel.dart';

class BuilderGroupListScreen extends StatefulWidget {
  const BuilderGroupListScreen({super.key});

  @override
  State<StatefulWidget> createState() => BuilderGroupListScreenState();
}

class BuilderGroupListScreenState extends State<BuilderGroupListScreen> {
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
                "Список строителей",
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
                itemCount: viewModel.builderGroups.length,
                itemBuilder: (b, index) {
                  return BuilderGroupCard(
                      builderGroup: viewModel.builderGroups[index],
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => NotesScreen()));
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
