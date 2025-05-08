// Añadir cuenta
abstract class Transaction {
  String _id;
  double _amount;

  Transaction(this._id, this._amount);

  void apply (Account account);

  String get id => _id;
  double get amount => _amount;
  set amout (double a) {_amount = a;}
}