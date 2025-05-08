import 'package:practica3/transaction.dart';

// Revisar nombres de los metodos de Account
class DepositTransaction extends Transaction{
  DepositTransaction (super.amount);

  @override
  void apply(account) {
    account.deposit(amount);
  }
}