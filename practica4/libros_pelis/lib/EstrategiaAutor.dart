class EstrategiaAutor{

  @Override
  List<Producto> buscar(gestor, es_peli, titulo,autor, fecha){
      return gestor.buscar(es_peli, null, autor, null);

}

