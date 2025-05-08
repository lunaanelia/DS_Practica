import 'package:practica3/Account.dart';
import 'package:uuid/uuid.dart';

abstract class Transaction {
  String _id = '';
  double _amount;

  Transaction(this._amount){
    generateId();
  }

  void generateId(){
    _id = const Uuid().v1();
  }

  void apply (Account account);

  String get id => _id;
  double get amount => _amount;
  set amout (double a) {_amount = a;}
}