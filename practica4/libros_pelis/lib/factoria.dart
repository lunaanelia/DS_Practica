import 'package:libros_pelis/libro.dart';
import 'package:libros_pelis/pelicula.dart';
import 'package:libros_pelis/gestor.dart';

class Factoria {
  Gestor _gestor;

  Factoria(this._gestor);

  crearProducto(String tipo, String titulo, String autor, String fecha, String descripcion)
  {
    if (tipo=="libro"){
      this._gestor.agregar(Libro(null, titulo, autor, fecha, descripcion));

    }
    else if (tipo=="pelicula"){
      this._gestor.agregar(Pelicula(null, titulo, autor, fecha, descripcion));
    }
    else{
      throw ArgumentError("Tipo de producto no válido: $tipo");
    }
  }
}