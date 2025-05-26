import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';

class EstrategiaAutor{

  @override
  Future<List<Producto>> buscar(Gestor gestor, bool es_peli, String autor){
      return gestor.buscar(es_peli, "autor", autor);
  }

}

