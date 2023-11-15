import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter_especialist/pages/shared/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../service/dark_mode_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var darkModeService = Provider.of<DarkModeService>(context);

    return MaterialApp(
      theme: darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Flutter Especialist"),
          actions: [
            const Center(
              child: Text("Dark Mode"),

            ),
            Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value){
                  darkModeService.darkMode = value;
                })
          ],
        ),
        drawer: const DrawerCustom(),
        body: Container(

        ),
      ),
    );
  }
}
