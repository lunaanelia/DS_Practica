class Correos {
  // Para hacerlo singleton, creamos un atributo de el mismo
  // que sea de clase y privada
  static final Correos _instancia = Correos._interna();
  final List<String> _correos = [];

  // Creamos el contructor privado
  Correos._interna();

  // Creamos el contructor publico, en el que crea
  // la instacia si no ha sido ya creada. Para ello
  // usamos factory que devuelve siempre la misma isntacia,
  // como si la creasemos solo una vez
  factory Correos() => _instancia;

  //metodos para añadir, ver si existe y quitar correos
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
