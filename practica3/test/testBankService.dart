import 'package:flutter_test/flutter_test.dart';
import 'package:practica3/BanckService.dart';
import 'package:practica3/Account.dart';


void main () {
  group("Tests para Bank Service", () {
    test("Comprobar que la lista inicial de cuentas esté vacía", () {
      BankService b = BankService();
      expect(b.getAllAcounts().length, 0 );
    });
  });
}