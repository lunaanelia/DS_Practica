import 'package:practica3/Account.dart';


class User {
  String _id;
  String _name;

  Set<Account> _accounts = {};

  User (this._id, this._name);

  String get name => this._name;
  String get id => this._id;
  Set<Account> get accounts => this._accounts;

  void addAccount (Account acc) {
    this._accounts.add(acc);
  }


  // Para poder tener un set implementamos el operador ==
  @override
  bool operator ==(Object other) {
    return other is User && this._id == other._id;
  }

  @override
  int get hashCode => this._id.hashCode;

}
