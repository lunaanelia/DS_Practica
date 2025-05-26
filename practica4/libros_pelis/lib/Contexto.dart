class Contexto{

    final gestorDeProducto gestor;

    I_estrategiaBusqueda _estrategia;

    Contexto(estrategia){
        this._estrategia = estrategia;
    }

    List<Producto> buscar(this.gestor, es_peli, titulo, autor, fecha){};
}