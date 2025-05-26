import 'package:libros_pelis/Producto.dart';

class Pelicula extends Producto {

  Pelicula(int? id, String titulo, String autor, DateTime fecha, String descripcion)
      :super(id, titulo, autor, fecha, descripcion);

}