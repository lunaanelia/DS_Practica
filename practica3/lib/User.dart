import 'package:practica3/Account.dart';


class User {
  String _id;
  String _name;

  Set<Account> _accounts = {};

  User (this._id, this._name);

  String get name => this._name;
  String get id => this._id;

  void addAccount (Account acc) {
    this._accounts.add(acc);
  }

  void showAccounts() {
    if (_accounts.isEmpty) {
      print ('El usuario ${this._name} con id ${this._id} no tiene cuentas registradas.');
    }
    else {
      print ('El usuario ${this._name} con id ${this._id} tiene las cuentas:');
      for (var acc in _accounts) {
        print('Cuenta ID: ${acc.id}, Saldo: ${acc.amount.toStringAsFixed(2)}');
      }
    }
  }

  // Para poder tener un set implementamos el operador ==
  @override
  bool operator ==(Object other) {
    return other is User && this._id == other._id;
  }

  @override
  int get hashCode => this._id.hashCode;

}

void main () {
  Account ac = Account();

  print ("El id de la cuenta es:");
  print(ac.id);

  Account ac2 = Account();
  print ("El id de la cuenta es:");
  print(ac2.id);

  User usuario = User("12345678", "Sofia");

  usuario.showAccounts();
  usuario.addAccount(ac);
  usuario.showAccounts();
  usuario.addAccount(ac2);
  usuario.showAccounts();
}