import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/producto.dart';

class EstrategiaAutor implements IEstrategiaBusqueda{

  @override
  Future<List<Producto>> buscar(Gestor gestor, bool es_peli, String autor){
    return gestor.buscar(es_peli, "autor", autor);
  }

}

