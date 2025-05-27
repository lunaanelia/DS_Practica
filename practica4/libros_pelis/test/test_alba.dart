import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/contexto.dart';
import 'package:libros_pelis/estrategia_titulo.dart';


void main(){

  group("conexion",(){
    test("conexion",() async{
      Gestor g = Gestor();
      bool s = await g.cargarTodosProductos();
      expect(s, true);
    });
  });

}