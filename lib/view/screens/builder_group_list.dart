import 'package:building_app/view/widgets/app_bottom_sheet.dart';
import 'package:building_app/view/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/home_viewmodel.dart';
import 'info_screen.dart';

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
                return ManageBuildersBottomSheet(
                  onSavePressed: (b) async {
                    Navigator.pop(context);
                    viewModel.builderGroups.add(b);
                    viewModel.saveBuildings();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Список строителей",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const InfoScreen()));
                },
                icon: const Icon(Icons.info_rounded),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: viewModel.loadBuilders(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data!.length > 0) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: viewModel.builderGroups.length,
                        itemBuilder: (b, index) {
                          return BuilderGroupCard(
                            builderGroup: viewModel.builderGroups[index],
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
                                  return ManageBuildersBottomSheet(
                                    builderGroup: viewModel.builderGroups[index],
                                    onSavePressed: (b) async {
                                      Navigator.pop(context);
                                      viewModel.builderGroups[index] = b;
                                      viewModel.saveBuilders();
                                      setState(() {});
                                    },
                                    onDeletePressed: () {
                                      Navigator.pop(context);
                                      viewModel.builderGroups.removeAt(index);
                                      viewModel.saveBuilders();
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
                    return Expanded(
                      child: Center(
                        child: Text("Бригады отсутствуют!"),
                      ),
                    );
                  }
                } else {
                  return Expanded(
                    child: Center(
                      child: Text("Бригады отсутствуют!"),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
