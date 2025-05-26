import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/producto.dart';


class Contexto{

    final Gestor _gestor;
    IEstrategiaBusqueda _estrategia;

    Contexto(this._gestor, this._estrategia);

    Future<List<Producto>> buscar(Gestor gestor, bool esPeli, String? dato) {
        return _estrategia.buscar(_gestor, esPeli, dato);
    }

    void setEstrategia(IEstrategiaBusqueda nuevaEstrategia) {
        _estrategia = nuevaEstrategia;
    }
}