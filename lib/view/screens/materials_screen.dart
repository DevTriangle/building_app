import 'package:building_app/view/screens/notes_screen.dart';
import 'package:building_app/view/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home_viewmodel.dart';

class MaterialsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MaterialsScreenState();
}

class MaterialsScreenState extends State<MaterialsScreen> {
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
                "Выбрать материал",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.materials.length,
                  itemBuilder: (b, index) {
                    return Column(
                      children: [
                        MaterialCard(
                            material: viewModel.materials[index],
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (builder) => NotesScreen()));
                            }),
                        SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
