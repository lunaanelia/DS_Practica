import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/gestor.dart';


abstract class IEstrategiaBusqueda{

    List<Producto> buscar(Gestor gestor, bool es_peli, String? dato);
}