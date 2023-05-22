import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<StatefulWidget> createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
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
                "Cправочная информация",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Об организации",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  height: 70,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Объекты недвижимости",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Основное направление деятельности компании - постройка объектов недвижимости. Об этом поподробнее, например, вы хотите построить на участке какое-то сооружение, для этого вам нужно купить материалы и выбрать рабочий класс, а быть точнее профессионал. И как раз-таки наше приложение поможет Вам в выборе.",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 32),
                const Text(
                  "С любовью “Объекты недвижимости”",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
