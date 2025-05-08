import 'package:practica3/transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
import 'package:practica3/deposit_transaction.dart';
import 'package:practica3/Account.dart';

class TransferTransaction extends Transaction{
  Account _to;

  TransferTransaction (super.amount, this._to);

  @override
  void apply(account) {
    if (_to != account){
      try{
        WithdrawalTransaction resta = WithdrawalTransaction(amount);
        DepositTransaction suma = DepositTransaction( amount);

        suma.apply(_to);
        resta.apply(account);

      }catch(e){
        throw e;
      }
    }else{
      throw StateError('No se puede ralizar a la misma cuanta');
    }
    
  }
}