
class TarefaModelProvider{
String _descricao = "";
bool _concluido = false;
int _id = 0;

int get id => _id;

  set id(int value) {
    _id = value;
  }

TarefaModelProvider(this._id, this._concluido, this._descricao);

bool get concluido => _concluido;

  set concluido(bool value) {
    _concluido = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }
}