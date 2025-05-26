import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';

void main () {

  group("Test de busqueda", () {

    test("El balance inicial de una cuenta debe ser cero", () {
      Account cuenta = Account();
      expect(cuenta.amount, 0);
    });

  });

}