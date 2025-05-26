import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';


class Contexto{

    final Gestor _gestor;
    IEstrategiaBusqueda _estrategia;

    Contexto(this._gestor, this._estrategia);

    List<Producto> buscar(bool esPeli, String? titulo, String? autor, String? fecha) {
        return _estrategia.buscar(_gestor, esPeli, titulo, autor, fecha);
    }

    void setEstrategia(IEstrategiaBusqueda nuevaEstrategia) {
        _estrategia = nuevaEstrategia;
    }
}