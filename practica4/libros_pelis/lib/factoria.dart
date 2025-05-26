import 'package:libros_pelis/producto.dart';
import 'package:libros_pelis/libro.dart';
import 'package:libros_pelis/pelicula.dart';


abstract class Factoria {
  Producto crearProducto(String tipo, String titulo, String autor, DateTime fecha, String descripcion)
  {
    if (tipo=="libro"){
      return Libro(null, titulo, autor, fecha, descripcion);
    }
    else if (tipo=="pelicula"){
      return Pelicula(null, titulo, autor, fecha, descripcion);
    }
    else{
      throw ArgumentError("Tipo de producto no válido: $tipo");
    }
  }
}