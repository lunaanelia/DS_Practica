import 'package:practica3/transaction.dart';
class WithdrawalTransaction extends Transaction{

  WithdrawalTransaction (super.amount);

  @override
  void apply(account) {

    if (account.amount < amount){ // no dinero suficiente
      throw StateError ('No hay dinero suficiente para realizar la transacción');
    }else{
      account.withdraw(amount);
    }
  }
}