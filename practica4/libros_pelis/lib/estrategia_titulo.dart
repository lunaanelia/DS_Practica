import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';

class EstrategiaTitulo{

   @override
    List<Producto> buscar(Gestor gestor, bool es_peli, String? titulo){
        return gestor.buscar(es_peli, "titulo", titulo);
    }

}