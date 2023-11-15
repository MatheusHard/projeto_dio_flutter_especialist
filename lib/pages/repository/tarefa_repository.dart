import 'package:flutter/cupertino.dart';
import 'package:projeto_dio_flutter_especialist/model/tarefa_model.dart';

class TarefaRepository extends ChangeNotifier{

  final _tarefas = <TarefaModel>[];
  var _apenasConcluidas = false;

  set apenasConcluidas(bool value){
    _apenasConcluidas = value;
    notifyListeners();
  }

 bool get apenasConcluidas => _apenasConcluidas;

  get tarefas =>  _apenasConcluidas ? _tarefas.where((element) => !element.concluido).toList() : _tarefas;

  adicionar(TarefaModel tarefa){
    _tarefas.add(tarefa);
    notifyListeners();
  }
  alterar(TarefaModel tarefa){
    _tarefas.where((element) => element.id == tarefa.id).first
        .concluido = tarefa.concluido;
    notifyListeners();
  }
  remover(int id){
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
    notifyListeners();
  }

}