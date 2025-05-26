class Contexto{

    final Gestor gestor;

    I_estrategiaBusqueda _estrategia;

    Contexto(estrategia){
        this.estrategia = estrategia;
    }

    List<Producto> buscar(this.gestor, es_peli, titulo, autor, fecha){};
}