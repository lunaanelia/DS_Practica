class producto {
  int? _id;
  String? _titulo;
  String? _autor;
  DateTime? _fecha;
  String? _descripcion;

  producto(this._id, this._titulo, this._autor, this._fecha, this._descripcion);

  // Constructor para crear un Producto a partir de un JSON
  factory producto.fromJson(Map<String, dynamic> json) {
    return producto(
      json['id'] as int?,
      json['titulo'] as String?,
      json['autor'] as String?,
      json['fecha'] != null ? DateTime.parse(json['fecha']) : null,
      json['descripcion'] as String?,
    );
  }

  // Convertir Producto a JSON
  Map<String, dynamic> toJson() {
    return {
      if (_id != null) 'id': _id,
      'titulo': _titulo,
      'autor': _autor,
      'fecha': _fecha?.toIso8601String(),
      'descripcion': _descripcion,
    };
  }

  @override
  String toString() {
    return '$_titulo por $_autor (${_fecha?.year ?? "sin fecha"})\nDescripción: $_descripcion';
  }

  // Getters
  int? get id => _id;
  String? get titulo => _titulo;
  String? get autor => _autor;
  DateTime? get fecha => _fecha;
  String? get descripcion => _descripcion;
}
