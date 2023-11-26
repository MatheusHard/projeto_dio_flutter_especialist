import 'package:flutter/material.dart';

class TarefaModel{

  final String _id = UniqueKey().toString();

  String _descricao = "";
  bool _concluido = false;

  TarefaModel(this._descricao, this._concluido);

  String get id => _id;

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  bool get concluido => _concluido;

  set concluido(bool value) {
    _concluido = value;
  }
}