import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/estrategia_titulo.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';

void main () {

  group("Test de busqueda", () {

    test("Busqueda por titulo", () async {

      Gestor g = Gestor();
      Producto libro = Producto(null, false, "La casa de Bernarda Alba", "Federico Garcia Lorca", "1936", "La obra refleja la situación social y política en España antes de la Guerra Civil.");
      g.agregar(libro);

      Contexto contexto = Contexto(g, EstrategiaTitulo());

      List<Producto> resultado = await contexto.buscar(false, "La casa de Bernarda Alba");
      expect(resultado, equals([libro]));
    });

  });


  test("Cargar los archivos subidos en la bd", ()  async {

    Gestor g = Gestor();
    await g.cargarTodosProductos();

    expect(g.getProductos().length, 0);
  });

}