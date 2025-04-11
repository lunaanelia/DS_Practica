class Correos {
  final List<String> _correos = [];

  void addCorreo(String c){
    _correos.add(c);
  }

  // Si tiene cooreo devuelve true
  bool existeCorreo(String c){
    return _correos.contains(c);
  }

  void removeCorreo(String c){
    _correos.remove(c);
  }
}