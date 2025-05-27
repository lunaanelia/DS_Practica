import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/estrategia_fecha.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/estrategia_autor.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';
import 'package:libros_pelis/factoria.dart';

void main(){

  group("Busqueda",(){
    test("Busqueda por autor",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      //Busca si ya existe la peli
      List<Producto> tmp= await contexto.buscar(true,"Bella");

      if(tmp.isNotEmpty){
        await gestor.eliminar(tmp[0]);
      }


      Producto peli=Producto(null,true,"Crepusculo","Bella","12-4-2000","Bella, where the hell have you been loca?");
      await gestor.agregar(peli);
      List<Producto> res= await contexto.buscar(true,"Bella");

      expect(res.length, equals(1));
      expect(res[0].autor, equals("Bella"));
    });
    test("Busqueda por fecha",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaFecha());

      //Busca si ya existe la peli
      List<Producto> tmp= await contexto.buscar(true,"12-4-2000");

      if(tmp.isNotEmpty){
        await gestor.eliminar(tmp[0]);
      }


      Producto peli=Producto(null,true,"Crepusculo","Bella","12-4-2000","Bella, where the hell have you been loca?");
      await gestor.agregar(peli);
      List<Producto> res= await contexto.buscar(true,"12-4-2000");

      expect(res.length, equals(1));
      expect(res[0].autor, equals("Bella"));
    });
    test("Busqueda sin coincidencias devuelve vacio",()async{

      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      List<Producto> res= await contexto.buscar(true,"Test_busqueda");

      expect(res.length, equals(0));
    });
  });

  group("BD", (){
    test("Eliminar", ()async{
      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      Producto peli=Producto(null,true,"test","test","12-4-2000","test");
      await gestor.agregar(peli);
      List<Producto> tmp= await contexto.buscar(true,"test");

      await gestor.eliminar(tmp[0]);

      gestor.cargarTodosProductos();

      expect(gestor.getProductos().length, equals(0));
    });
    test("Que no se puedan crear productos duplicados", ()async{
      Gestor gestor= Gestor();
      Contexto contexto= Contexto(gestor,EstrategiaAutor());

      Producto peli=Producto(null,true,"test","test","12-4-2000","test");
      await gestor.agregar(peli);

      expect(() async => await gestor.agregar(peli), throwsA(isA<Exception>()));

      List<Producto> tmp= await contexto.buscar(true,"test"); //Lo borra al acabar el test

      await gestor.eliminar(tmp[0]);

    });
  });

  group("Factoria", (){
    test("Factoria incorrecta da error",(){
      Gestor gestor= Gestor();

      Factoria factoria= Factoria(gestor);

      expect( () => factoria.crearProducto("coche", "brum brum", "paco", "12-4-2020", "kachau"),throwsA(isA<ArgumentError>()));
    });
  });

}