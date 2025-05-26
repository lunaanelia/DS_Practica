import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/i_estrategia_busqueda.dart';


class EstrategiaFecha implements IEstrategiaBusqueda{

  @override
  Future<List<Producto>> buscar(Gestor gestor, bool es_peli, String valor){
    return gestor.buscar(es_peli, "fecha", valor);
  }
}
