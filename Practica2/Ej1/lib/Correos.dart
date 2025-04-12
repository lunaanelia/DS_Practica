class Correos {
  // Para hacerlo singleton
  static final Correos _instancia = Correos._interna();

  Correos._interna();

  factory Correos() => _instancia;

  // Lo que teniamso
  final List<String> _correos = [];

  void addCorreo(String c) {
    _correos.add(c);
  }

  bool existeCorreo(String c) {
    return _correos.contains(c);
  }

  void removeCorreo(String c) {
    _correos.remove(c);
  }
}
