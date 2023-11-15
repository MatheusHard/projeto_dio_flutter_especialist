import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter_especialist/pages/home_page.dart';
import 'package:projeto_dio_flutter_especialist/pages/repository/tarefa_repository.dart';
import 'package:provider/provider.dart';

import '../service/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DarkModeService()),
        ChangeNotifierProvider<TarefaRepository>(create: (_)=> TarefaRepository())
      ],
      child:  const HomePage()
    );
  }
}
