class EstrategiaAutor{

<<<<<<< HEAD
  @Override
  List<Producto> buscar(gestor, es_peli, titulo,autor, fecha){
      return gestor.buscar(es_peli, null, autor, null);
=======
  List<Producto> buscar(es_peli, titulo,autor, fecha){
    return buscar(es_peli, null, autor, null);
>>>>>>> ca67108dffa2eb2a5eca21d20805c2bb9d8364af
  }

}

