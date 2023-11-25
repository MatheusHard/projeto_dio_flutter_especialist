// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefas_store_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefasStore on _ListaTarefasStore, Store {
  Computed<List<TarefaStore>>? _$tarefasComputed;

  @override
  List<TarefaStore> get tarefas =>
      (_$tarefasComputed ??= Computed<List<TarefaStore>>(() => super.tarefas,
              name: '_ListaTarefasStore.tarefas'))
          .value;

  late final _$_apenasConcluidosAtom =
      Atom(name: '_ListaTarefasStore._apenasConcluidos', context: context);

  @override
  Observable<bool> get _apenasConcluidos {
    _$_apenasConcluidosAtom.reportRead();
    return super._apenasConcluidos;
  }

  @override
  set _apenasConcluidos(Observable<bool> value) {
    _$_apenasConcluidosAtom.reportWrite(value, super._apenasConcluidos, () {
      super._apenasConcluidos = value;
    });
  }

  late final _$_ListaTarefasStoreActionController =
      ActionController(name: '_ListaTarefasStore', context: context);

  @override
  void apenasConcluidos(bool value) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.apenasConcluidos');
    try {
      return super.apenasConcluidos(value);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionar(String descricao) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.adicionar');
    try {
      return super.adicionar(descricao);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.alterar');
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remover(String id) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.remover');
    try {
      return super.remover(id);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
