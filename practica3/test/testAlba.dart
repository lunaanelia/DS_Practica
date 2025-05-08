import 'package:flutter_test/flutter_test.dart';
import 'package:practica3/BankService.dart';
import 'package:practica3/Account.dart';


void main () {
  group("Tests pararet2 Bank Service", () {
    test("Comprobar que transfer mueva los fondos correctamente", () {
      BankService b = BankService();
      Account a1 = b.createAccount("1", "a1");
      Account a2 = b.createAccount("2", "a2");

      b.deposit(a1.id, 20);
      b.transfer(a1.id, a2.id, 10);

      expect(a1.amount, 10);
      expect(a2.amount, 10);
    });

    test("Comprobar que transfer mueva los fondos correctamente", () {
      BankService b = BankService();
      Account a1 = b.createAccount("1", "a1");
      Account a2 = b.createAccount("2", "a2");

      b.deposit(a1.id, 20);
      b.transfer(a1.id, a2.id, 10);

      expect(a1.amount, 10);
      expect(a2.amount, 10);
    });
    
  });
}