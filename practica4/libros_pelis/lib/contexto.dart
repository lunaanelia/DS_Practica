import 'package:libros_pelis/i_estrategia_busqueda.dart';

class Contexto{

    final Gestor _gestor;
    IEstrategiaBusqueda _estrategia;

    Contexto(Gestor gestor, IEstrategiaBusqueda estrategia){
        this.gestor = gestor;
        this._estrategia = estrategia;
    }

    List<Producto> buscar(this.gestor, es_peli, titulo, autor, fecha){};
}