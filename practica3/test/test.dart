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

  group("Tests para Bank Service", () {
    test("Comprobar que la lista inicial de cuentas esté vacía", () {
      BankService b = BankService();
      expect(b
          .getAllAcounts()
          .length, 0);
    });

    test("Deposit aumenta el saldo de la cuenta", () {
      BankService b = BankService();
      Account c = b.createAccount("id", "Sofia");

      expect(c.amount, 0);
      b.deposit(c.id, 100);
      expect(c.amount, 100);
    });

    test("Withdraw lanza StateError cuando el saldo insuficiente", () {
      BankService b = BankService();
      Account c = b.createAccount("id", "Sofia");
      expect(() => b.withdraw(c.id, 50), throwsA(isA<StateError>()));
    });
  });


}