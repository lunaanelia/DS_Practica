import 'package:libros_pelis/producto.dart';

class Pelicula extends Producto {

  Pelicula(int? id, String titulo, String autor, String fecha, String descripcion)
      :super(id, true, titulo, autor, fecha, descripcion);


}