import 'package:libros_pelis/i_estrategia_busqueda.dart';

class Contexto{

    final Gestor gestor;

    IEstrategiaBusqueda _estrategia;

    Contexto(estrategia){
        this._estrategia = estrategia;
    }

    List<Producto> buscar(this.gestor, es_peli, titulo, autor, fecha){};
}