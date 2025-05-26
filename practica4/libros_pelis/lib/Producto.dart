class Producto {
  String ?_titulo;
  String ?_autor;
  DateTime ?_fecha;
  String ?_descripcion;

  Producto(this._titulo, this._autor, this._fecha, this._descripcion);


  String? get titulo => _titulo;
  String? get autor => _autor;
  DateTime? get fecha => _fecha;
  String? get descripcion => _descripcion;
}