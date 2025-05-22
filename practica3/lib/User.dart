import 'package:practica3/Account.dart';


class User {

  String _name;
  Set<Account> _accounts = {};

  User (this._name);

  String get name => this._name;

  Set<Account> get accounts => this._accounts;


  void addAccount (Account acc) {

    acc.name = "Cuenta" + (this._accounts.length+1).toString();
    this._accounts.add(acc);
  }

  // Para poder tener un set implementamos el operador ==
  @override
  bool operator ==(Object other) {
    return other is User && this._name == other._name;
  }

  @override
  int get hashCode => this._name.hashCode;

}
