import 'package:uuid/uuid.dart';

class Account {
  String _id = '';
  double _amount = 0;
  String _name ="";

  Account() {
    generateId();
  }

  set name(String valor) { this._name = valor; }


  // Para generar un Id a partir del tiempo
  void generateId() {
    _id = const Uuid().v1();
  }

  String get id => _id;
  String get name => this._name;
  double get amount => _amount;

  void deposit (double amount) {
    if(amount>0) this._amount += amount;
  }

  void withdraw (double amount) {
    if(amount>0) this._amount -= amount;
  }

  // Para poder tener un set implementamos el operador ==
  @override
  bool operator ==(Object other) {
    return other is Account && this._id == other._id;
  }

  @override
  int get hashCode => this._id.hashCode;
}

