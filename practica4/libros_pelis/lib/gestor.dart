import 'dart:convert';
import "package:http/http.dart" as http;
import 'producto.dart';

//agregar(Producto)
//eliminar (id_producto)
//cargarTodasPelis
//cargarTodasLibros

//buscar(es_peli, arrayfiltros)
//actualizar(id_producto, ….)


class Gestor {
  List<Producto> _misProductos= [];
  final String apiUrl = "http://localhost:3000/producto";

  Gestor(this._misProductos);

  /* Future<void> cargarTareas(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrl?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> tareasJson = json.decode(response.body);

      mistareas.clear();
      mistareas.addAll(tareasJson.map((json) => Tarea.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load tasks');
    }
  } */

  Future<void> agregar(Producto producto) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(producto.toJson()),
    );
    if (response.statusCode == 201) {
      _misProductos.add(Producto.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add task: ${response.body}');
    }
  }

  Future<void> eliminar(Producto producto) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/${producto.id}'),
    );
    if (response.statusCode == 200) {
      _misProductos.removeWhere((p) => p.id == producto.id);
    } else {
      throw Exception('Failed to delete task');
    }
  }

  Future<void> modificarProducto(Producto producto) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${producto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        '': nuevoEstadoCompletado,
      }),
    );

    if (response.statusCode == 200) {
      tarea.completada = nuevoEstadoCompletado;
    } else {
      throw Exception('Failed to update task');
    }
  }
}