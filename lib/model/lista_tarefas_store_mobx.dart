
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_dio_flutter_especialist/model/tarefa_model_mobx.dart';

part 'lista_tarefas_store_mobx.g.dart';

class ListaTarefasStore = _ListaTarefasStore with _$ListaTarefasStore;

abstract class _ListaTarefasStore with Store{

  ObservableList<TarefaStore> _tarefas = ObservableList<TarefaStore>();

  @observable
  var _apenasConcluidos = Observable(false);

  @computed
  List<TarefaStore> get tarefas => getApenasConcluidos
     ? _tarefas.where((element) => !element.concluido).toList()
     : _tarefas.toList();

  @action
  void apenasConcluidos(bool value){
    _apenasConcluidos.value = value;
  }
 bool get getApenasConcluidos => _apenasConcluidos.value;

  @action
  void adicionar(String descricao){
    _tarefas.add(TarefaStore(descricao, false));
  }
  @action
  void alterar(String id, String descricao, bool concluido){
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
     tarefa.alterar(descricao, concluido);
  }
  @action
  void remover(String id){
    _tarefas.removeWhere((element) => element.id == id);

  }



}





















