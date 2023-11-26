import 'package:get/get.dart';
import 'package:projeto_dio_flutter_especialist/model/tarefa_model.dart';

class ListaTarefasController extends GetxController {


  var _apenasconcluidos = false.obs;
  RxList<TarefaModel> _tarefas = <TarefaModel>[].obs;


  List<TarefaModel> get tarefas => _apenasconcluidos.value
      ? _tarefas.where((element) => element.concluido).toList().obs
      : _tarefas.toList().obs;


  bool get apenasConcluidos => _apenasconcluidos.value;

  void setApenasConcluidos(bool value) {
    _apenasconcluidos.value = value;
  }

  adicionar(String descricao){
    _tarefas.add(TarefaModel(descricao, false));
  }

  atualizar(String id, String tDescricao, bool tConcluido){

    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.concluido = tConcluido;
    tarefa.descricao = tDescricao;
    _tarefas.refresh();
  }
  excluir(String id){
  _tarefas.removeWhere((element) => element.id == id);
  }
}