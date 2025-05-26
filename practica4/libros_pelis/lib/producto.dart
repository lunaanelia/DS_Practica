class Producto {
  int? _id;
  String? _titulo;
  String? _autor;
  String? _fecha;
  String? _descripcion;

  Producto(this._id, this._titulo, this._autor, this._fecha, this._descripcion);

  // Constructor para crear un Producto a partir de un JSON
  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      json['id'] as int?,
      json['titulo'] as String?,
      json['autor'] as String?,
      json['fecha'] !as String?,
      json['descripcion'] as String?,
    );
  }

  // Convertir Producto a JSON
  Map<String, dynamic> toJson() {
    return {
      if (_id != null) 'id': _id,
      'titulo': _titulo,
      'autor': _autor,
      'fecha': _fecha,
      'descripcion': _descripcion,
    };
  }

  @override
  String toString() {
    return '$_titulo por $_autor ($_fecha)\nDescripción: $_descripcion';
  }

  // Getters
  int? get id => _id;
  String? get titulo => _titulo;
  String? get autor => _autor;
  String? get fecha => _fecha;
  String? get descripcion => _descripcion;


  // Setters
  set id(int? value) => _id = value;
  set titulo(String? value) => _titulo = value;
  set autor(String? value) => _autor = value;
  set fecha(String? value) => _fecha = value;
  set descripcion(String? value) => _descripcion = value;


}
