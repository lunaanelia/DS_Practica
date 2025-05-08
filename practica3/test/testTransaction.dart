import 'package:flutter_test/flutter_test.dart';
import 'package:practica3/BankService.dart';
import 'package:practica3/Account.dart';
import 'package:practica3/deposit_transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
import 'package:practica3/transfer_transaction.dart';


void main () {
  group("Tests para Transactions", () {
    test("Comprobar que DepositTransaction.apply aumenta el saldo correctamente ", () {
        Account account=Account();
        DepositTransaction deposito=DepositTransaction(25);
        deposito.apply(account);

        expect( account.amount , equals(25) );

    });

    test("Comprobar que WithdrawalTransaction.apply lanza StateError cuando no hay fondos suficientes ", () {

      Account account=Account();
      DepositTransaction deposito=DepositTransaction(25);
      deposito.apply(account);

      WithdrawalTransaction retirada=WithdrawalTransaction(40);

      expect( ()=>retirada.apply(account) , throwsA(isA<StateError>() ) );

    });

    test("Comprobar que TransferTransaction.apply mueve fondos entre cuentas de forma correcta ", () {

      Account account1=Account();
      Account account2=Account();
      DepositTransaction deposito=DepositTransaction(25);
      deposito.apply(account1);

      TransferTransaction transferencia=TransferTransaction (10,account2);

      transferencia.apply(account1);

      expect( account1.amount , equals(15) );
      expect( account2.amount , equals(10) );
    });

  });
}