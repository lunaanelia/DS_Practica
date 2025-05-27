import 'package:flutter_test/flutter_test.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/estrategia_autor.dart';
import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';

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
  });

}