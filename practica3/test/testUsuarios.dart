import 'package:flutter_test/flutter_test.dart';
import 'package:practica3/BankService.dart';
import 'package:practica3/Account.dart';

//Test usuarios
void main () {

  //El balance inicial de una cuenta debe ser cero
  //No se permite depositar cantidades negativas o cero
  //No se permite retirar cantidades negativas o cero


  group("Tests para usuarios", () {
    test("El balance inicial de una cuenta debe ser cero", () {
        Account cuenta = Account();
        expect(cuenta.amount, 0);
    });
    test("No se permite depositar cantidades negativas o cero", () {
      Account cuenta = Account();
      cuenta.deposit(-5);
      expect(cuenta.amount, 0);
    });
    test("No se permite retirar cantidades negativas o cero", () {
      Account cuenta = Account();
      cuenta.deposit(10);
      cuenta.withdraw(-5);
      expect(cuenta.amount, 10);
    });
  });
}