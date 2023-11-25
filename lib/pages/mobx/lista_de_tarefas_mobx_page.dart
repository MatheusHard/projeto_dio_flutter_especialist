import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../model/lista_tarefas_store_mobx.dart';

class ListaDeTarefasMobxPage extends StatelessWidget {
  ListaDeTarefasMobxPage({super.key});

  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;

  var listaTarefasStore = ListaTarefasStore();

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
                            listaTarefasStore.adicionar(descricaoContoller.text);
                            Navigator.pop(context);
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
                    Observer(
                      //                            value: listaTarefasStore.getApenasConcluidos,
                      //                               onChanged:  listaTarefasStore.apenasConcluidos);
                      //
                        builder: (_) {
                          return Switch(
                              value: listaTarefasStore.getApenasConcluidos,
                              onChanged:  listaTarefasStore.apenasConcluidos
                              );
                        }
                    )
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (context) {
                      return ListView.builder(
                          itemCount: listaTarefasStore.tarefas.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = listaTarefasStore.tarefas[index];
                            return Observer(
                              builder: (context) {
                                return Dismissible(
                                  onDismissed: (DismissDirection dismissDirection) async {
                                    listaTarefasStore.remover(tarefa.id);
                                  },
                                  key: Key(tarefa.descricao),
                                  child: ListTile(
                                    title: Text(tarefa.descricao),
                                    trailing: Switch(
                                      onChanged: (bool value) async {
                                        tarefa.concluido = value;
                                        listaTarefasStore.alterar(tarefa.id, tarefa.descricao,tarefa.concluido);
                                      },
                                      value: tarefa.concluido,
                                    ),
                                  ),
                                );
                              }
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
