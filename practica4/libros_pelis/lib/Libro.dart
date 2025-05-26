import 'package:libros_pelis/Producto.dart';

class Libro extends Producto {

  Libro(int? id, String titulo, String autor, DateTime fecha, String descripcion)
      :super(id, titulo, autor, fecha, descripcion);

}