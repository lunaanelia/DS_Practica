import 'package:practica3/transaction.dart';
import 'package:practica3/Account.dart';

class WithdrawalTransaction extends Transaction{

  WithdrawalTransaction (double amount): super(amount);

  @override
  void apply(account) {

    if (account.amount< amount){ // no direno suficiente
      throw StateError ('No hay dinero suficiente para realizar la transacción');
    }else{
      account.withdraw(amount);
    }
  }
}