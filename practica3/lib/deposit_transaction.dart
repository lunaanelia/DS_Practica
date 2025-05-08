import 'package:practica3/transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
// Revisar nombres de los metodos de Account
class DepositTransaction extends Transaction{
  Account _to;
  DepositTransaction (String id, double amount, this._to): super(id, amount);

  @override
  void apply(account) {

    try{
      WithdrawalTransaction resta =  new WithdrawalTransaction(id, amount);
      DepositTransaction suma = new DepositTransaction(id, amount);

      resta.apply(_to);
      suma.apply(account);

    }catch(e){
      throw e;
    }
  }
}