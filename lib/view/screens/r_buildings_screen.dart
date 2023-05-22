import 'package:building_app/view/widgets/app_card.dart';
import 'package:building_app/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RBuildingsScreen extends StatefulWidget {
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.buildings.length,
                  itemBuilder: (b, index) {
                    return Column(
                      children: [
                        BuildingCard(
                          building: viewModel.buildings[index],
                          onTap: () {},
                        ),
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
