import 'package:libros_pelis/producto.dart';

class Libro extends Producto {

  Libro(int? id, String titulo, String autor, String fecha, String descripcion)
      :super(id, false, titulo, autor, fecha, descripcion);

}