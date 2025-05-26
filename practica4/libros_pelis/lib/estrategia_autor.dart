import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';

class EstrategiaAutor{

  @override
  List<Producto> buscar(Gestor gestor, bool es_peli, String? titulo, String? autor, DateTime? fecha){
      return gestor.buscar({es_peli, null, autor, null});
  }

}

