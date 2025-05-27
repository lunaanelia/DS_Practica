import 'dart:convert';
import "package:http/http.dart" as http;
import 'producto.dart';

//cargarTodasPelis
//cargarTodasLibros

//buscar(es_peli, arrayfiltros)
//actualizar(id_producto, ….)


class Gestor {
  final List<Producto> _misProductos= [];
  final String apiUrl = "http://localhost:3000/producto";

  Gestor(){
    if(this._misProductos.isEmpty){
      this.cargarTodosProductos();
    }
  }

  Future<List<Producto>> buscar( bool es_peli, String que, String valor) async {

    List<Producto> resultadoBusquedad= [];
    Map<String, String> parametros= {};

    parametros['es_peli'] = es_peli.toString();

    parametros[que] = valor;

    final parsedUri= Uri.parse(apiUrl); //Para obtener el objeto Uri

    final u = Uri(
      scheme: parsedUri.scheme,
      host: parsedUri.host,
      port: parsedUri.port,
      path: parsedUri.path,
      queryParameters: parametros,
    );
print(u);
    // Primero tareamos las peliculas
    final responsePelis = await http.get(u);
    if (responsePelis.statusCode == 200) {
      List<dynamic> productosJson = json.decode(responsePelis.body);

      resultadoBusquedad.addAll(productosJson.map((json) => Producto.fromJson(json)).toList());

      return resultadoBusquedad;

    } else {
      throw Exception('Failed to load tasks');
    }

  }


  Future<bool> cargarTodosProductos() async {
    // Primero tareamos las peliculas
    bool correcto = true;
    final responsePelis = await http.get(Uri.parse('$apiUrl?es_peli=true'));
    if (responsePelis.statusCode == 200) {
      List<dynamic> productosJson = json.decode(responsePelis.body);

      _misProductos.clear();
      _misProductos.addAll(productosJson.map((json) => Producto.fromJson(json)).toList());

    } else {
      throw Exception('Failed to load product');
    }

    final responseLibro = await http.get(Uri.parse('$apiUrl?es_peli=false'));
    if (responseLibro.statusCode == 200) {
      List<dynamic> productosJson = json.decode(responseLibro.body);

      _misProductos.addAll(productosJson.map((json) => Producto.fromJson(json)).toList());
      correcto = true;
    } else {
      correcto = false;
      throw Exception('Failed to load tasks');
    }

    return correcto;
  }

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
      throw Exception('Failed to delete product');
    }
  }

  Future<void> modificarTitulo(Producto producto, String n_titulo) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${producto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'titulo': n_titulo
      }),
    );

    if (response.statusCode == 200) {
      producto.titulo = n_titulo;
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<void> modificarDescripcion(Producto producto, String n_desc) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${producto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'titulo': n_desc
      }),
    );

    if (response.statusCode == 200) {
      producto.descripcion = n_desc;
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<void> modificarAutor(Producto producto, String n_autor) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${producto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'autor': n_autor
      }),
    );

    if (response.statusCode == 200) {
      producto.autor = n_autor;
    } else {
      throw Exception('Failed to update product');
    }
  }

  //
  Future<void> modificarFecha(Producto producto, String n_fecha) async {

    final response = await http.patch(
      Uri.parse('$apiUrl/${producto.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'fecha': DateTime.parse(n_fecha)
      }),
    );

    if (response.statusCode == 200) {
      producto.fecha = n_fecha;
    } else {
      throw Exception('Failed to update product');
    }
  }
}