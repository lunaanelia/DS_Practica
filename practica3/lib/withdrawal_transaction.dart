import 'package:practica3/transaction.dart';

class WithdrawalTransaction extends Transaction{

  WithdrawalTransaction (String id, double amount): super(id, amount);

  @override
  void apply(account) {

    if (account.getAmount()< amount){ // no direno suficiente
      throw StateError ('No hay dinero suficnete para realizar la transacción');
    }else{
      double resta = account.getAmount() - amount;
      account.setAmount(resta);
    }
  }
}