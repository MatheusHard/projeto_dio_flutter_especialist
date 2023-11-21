import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/tarefa_model_provider.dart';
import '../repository/tarefa_repository.dart';

class ListaDeTarefasProvider extends StatelessWidget {
   ListaDeTarefasProvider({super.key});

  TarefaRepository tarefaRepository = TarefaRepository();
  var _tarefas = const <TarefaModelProvider>[];
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
          appBar: AppBar(title: const Text("Tarefas Provider"),),
         floatingActionButton: FloatingActionButton(
           child: const Icon(Icons.add),
           onPressed: () {
             descricaoContoller.text = "";
             showDialog(
                 context: context,
                 builder: (BuildContext bc) {
                   return AlertDialog(
                     title: const Text("Adicionar tarefa"),
                     content: TextField(
                       controller: descricaoContoller,
                     ),
                     actions: [
                       TextButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           child: const Text("Cancelar")),
                       TextButton(
                           onPressed: () async {
                             Random random = Random();
                             int id = random.nextInt(999);
                             Provider.of<TarefaRepository>(
                                 context,
                                 listen: false,                            
                             ).adicionar(TarefaModelProvider(id, false,descricaoContoller.text));
                             Navigator.pop(context);
                          //   obterTarefas();
                           //  setState(() {});
                           },
                           child: const Text("Salvar"))
                     ],
                   );
                 });
           },
         ),
         body: Container(
           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
           child: Column(
             children: [
               Container(
                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                       "Apenas concluídos",
                       style: TextStyle(fontSize: 18),
                     ),
                     Consumer<TarefaRepository>(
                       builder: (_, tarefaRepository, Widget) {
                         return Switch(
                             value: tarefaRepository.apenasConcluidas,
                             onChanged: (bool value) {
                               apenasNaoConcluidos = value;
                              Provider.of<TarefaRepository>
                                (context,
                                listen: false
                                ).apenasConcluidas = value;
                             });
                       }
                     )
                   ],
                 ),
               ),
               Expanded(
                 child: Consumer<TarefaRepository>(
                   builder: (_, tarefaRepository, Widget) {
                     return ListView.builder(
                         itemCount: tarefaRepository.tarefas.length,
                         itemBuilder: (BuildContext bc, int index) {
                           var tarefa = tarefaRepository.tarefas[index];
                           return Dismissible(
                             onDismissed: (DismissDirection dismissDirection) async {
                              Provider.of<TarefaRepository>
                                (context,
                                listen: false                              
                                ).remover(tarefa.id);
                             },
                             key: Key(tarefa.descricao),
                             child: ListTile(
                               title: Text(tarefa.descricao),
                               trailing: Switch(
                                 onChanged: (bool value) async {
                                   tarefa.concluido = value;
                                   Provider.of<TarefaRepository>
                                     (context,
                                     listen: false
                                     ).alterar(TarefaModelProvider(tarefa.id, tarefa.concluido, tarefa.descricao));
                                 },
                                 value: tarefa.concluido,
                               ),
                             ),
                           );
                         });
                   }
                 ),
               ),
             ],
           ),
         ));
   }
}
