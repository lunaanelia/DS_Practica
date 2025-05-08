import 'package:flutter_test/flutter_test.dart';
import 'package:practica3/BanckService.dart';
import 'package:practica3/Account.dart';


void main () {
  group("Tests para Bank Service", () {
    test("Comprobar que la lista inicial de cuentas esté vacía", () {
      BankService b = BankService();
      expect(b.getAllAcounts().length, 0 );
    });

    test("Deposit aumenta el saldo de la cuenta", () {
      BankService b = BankService();
      Account c = b.createAccount("id", "Sofia");

    });

    test("Withdraw lanza StateError cuando el saldo insuficiente", () {
      BankService b = BankService();
      Account c = b.createAccount("id", "Sofia");
      expect(() => b.withdraw(c.id, 50), throwsA(isA<StateError>()));
    });
  });
}