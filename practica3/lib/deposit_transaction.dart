import 'package:practica3/transaction.dart';
import 'package:practica3/Account.dart';

// Revisar nombres de los metodos de Account
class DepositTransaction extends Transaction{
  DepositTransaction (double amount): super(amount);

  @override
  void apply(account) {
    account.deposit(amount);
  }
}