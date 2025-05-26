class Producto {
  int? _id;
  String ?_titulo;
  String ?_autor;
  DateTime ?_fecha;
  String ?_descripcion;

  Producto(this._id, this._titulo, this._autor, this._fecha, this._descripcion);


  // factory es necesaria para este otro constructor.
  // Para introducir una tarea (objeto) a la Base de Datos (JSON)
  factory Producto.fromJson(Map<String, dynamic> json) { // estamos cogiendo los datos de la BD
    return Producto(
      id: json['id'] as int?,
      descripcion: json['descripcion'] as String?,
      completada: json['completada'] as bool?,
      usuario: json['usuario'] as String?,
    );
  }

// Cuando quiero mandar los datos de la tarea a la BD (lo paso a JSON)
  Map<String, dynamic> toJson() {
    return {
      if (id != null)
        'id': id,
      'descripcion': descripcion,
      'completada': completada,
      'usuario': usuario
    };
  }

  @override
  String toString() {
    return '${completada ?? false ? "Completed" : "Not completed"}: $descripcion (Usuario: $usuario)';
  }

  int? get id => this._id;
  String? get titulo => this._titulo;
  String? get autor => this._autor;
  DateTime? get fecha => this._fecha;
  String? get descripcion => this._descripcion;
}