import 'package:uuid/uuid.dart';

class Account {
  String _id = '';
  double _amount = 0;

  Account() {
    generateId();
  }

  // Para generar un Id a partir del tiempo
  void generateId() {
    _id = const Uuid().v1();
  }

  String get id => _id;
  double get amount => _amount;

  void deposit (double amount) {
    this._amount += amount;
  }

  void withdraw (double amount) {
    this._amount -= amount;
  }

  // Para poder tener un set implementamos el operador ==
  @override
  bool operator ==(Object other) {
    return other is Account && this._id == other._id;
  }

  @override
  int get hashCode => this._id.hashCode;
}

void main () {
  Account ac = Account(0);

  print ("El id de la cuenta es:");
  print(ac.id);

  Account ac2 = Account(0);
  print ("El id de la cuenta es:");
  print(ac2.id);
}
