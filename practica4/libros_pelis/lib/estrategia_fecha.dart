import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';

class EstrategiaFecha{

  @override
<<<<<<< HEAD
  List<Producto> buscar(Gestor gestor, bool es_peli, String? titulo, String? autor, DateTime? fecha){
    return gestor.buscar({es_peli, null, null, fecha});
=======
  Future<List<Producto>> buscar(Gestor gestor, bool es_peli, String fecha){
    return gestor.buscar(es_peli, "fecha", fecha);
>>>>>>> refs/remotes/origin/main
  }

}
