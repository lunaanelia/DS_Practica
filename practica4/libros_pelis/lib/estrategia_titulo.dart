class EstrategiaTitulo{

   @Override
    List<Producto> buscar(Gestor gestor, bool es_peli, String? titulo, String? autor, String? fecha){
        return gestor.buscar(es_peli, titulo, null, null);
    }

}