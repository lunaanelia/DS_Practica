class estrategia_titulo{

   @Override
    List<Producto> buscar(gestor,es_peli, titulo, autor, fecha){
        return gestor.buscar(es_peli, titulo, null, null);
    }

}