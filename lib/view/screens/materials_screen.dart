import 'package:building_app/view/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home_viewmodel.dart';
import '../widgets/app_bottom_sheet.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

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
                return ManageMaterialBottomSheet(
                  onSavePressed: (m) async {
                    Navigator.pop(context);
                    viewModel.materials.add(m);
                    viewModel.saveMaterials();
                    setState(() {});
                  },
                );
              },
            );
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
                "Выбрать материал",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: viewModel.loadMaterials(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: viewModel.materials.length,
                        itemBuilder: (b, index) {
                          return MaterialCard(
                            material: viewModel.materials[index],
                            onTap: () {
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
                                  return ManageMaterialBottomSheet(
                                    material: viewModel.materials[index],
                                    onSavePressed: (m) {
                                      Navigator.pop(context);
                                      viewModel.materials[index] = m;
                                      viewModel.saveMaterials();
                                      setState(() {});
                                    },
                                    onDeletePressed: () {
                                      Navigator.pop(context);
                                      viewModel.materials.removeAt(index);
                                      viewModel.saveMaterials();
                                      setState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Материалы отсутствуют!",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        "Материалы отсутствуют.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
