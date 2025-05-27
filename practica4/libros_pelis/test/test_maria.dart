import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/estrategia_titulo.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';

void main () {

  group("Test de busqueda", () {

    test("Busqueda por titulo", () async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      //Busca si ya existe el libro
      List<Producto> tmp= await contexto.buscar(false,"La casa de Bernarda Alba");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }

      Producto libro = Producto(null, false, "La casa de Bernarda Alba", "Federico Garcia Lorca", "12-4-2000", "La obra refleja la situación social y política en España antes de la Guerra Civil.");
      await g.agregar(libro);
      List<Producto> resultado = await contexto.buscar(false, "La casa de Bernarda Alba");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("La casa de Bernarda Alba"));
    });


    test("Aniadir producto a la base de datos", ()  async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      //Primero  busca si existe el libro que voy a buscar y si lo encuentra lo borra
      //Esto se hace para que pase el test y no de error al agregar un libro que ya esta
      //Busca si ya existe el libro
      List<Producto> tmp= await contexto.buscar(false,"Test añadir producto");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }

      Producto libro = Producto(null, false, "Test añadir producto", "Test", "27-5-2025", "Esto es una prueba.");
      await g.agregar(libro);


      List<Producto> resultado = await contexto.buscar(false, "Test añadir producto");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("Test añadir producto"));
    });


    test("Modificar un producto de la base de datos", ()  async {

      Gestor g = Gestor();
      Contexto contexto = Contexto(g, EstrategiaTitulo());

      //Primero  busca si existe el libro que voy a buscar y si lo encuentra lo borra
      //Esto se hace para que pase el test y no de error al agregar un libro que ya esta
      //Busca si ya existe el libro
      List<Producto> tmp= await contexto.buscar(false,"Test modificar producto");

      if(tmp.isNotEmpty){
        await g.eliminar(tmp[0]);
      }

      //Añade el producto
      Producto libro = Producto(null, false, "Test modificar producto", "Test", "27-5-2025", "Esto es una prueba.");
      await g.agregar(libro);

      await g.modificarTitulo(libro, "Ya se ha modificado");

      List<Producto> resultado = await contexto.buscar(false, "Ya se ha modificado");

      expect(resultado.length, equals(1));
      expect(resultado[0].titulo, equals("Ya se ha modificado"));
    });

  });






  //este no va a funcionar cuando haya más productos
  test("Cargar los archivos subidos en la bd", ()  async {

    Gestor g = Gestor();
    await g.cargarTodosProductos();

    expect(g.getProductos().length, 2);
  });

}