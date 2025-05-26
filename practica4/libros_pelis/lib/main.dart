import 'package:flutter/material.dart';
import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';
import 'package:libros_pelis/estrategia_autor.dart';
import 'package:libros_pelis/estrategia_fecha.dart';
import 'package:libros_pelis/estrategia_titulo.dart';
import 'package:libros_pelis/producto.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Gestor _gestor = Gestor();
  String _rolSeleccionado = "Usuario";
  static const List<String> usuarios = <String>['Administrador', 'Usuario'];
  static const List<String> busquedas = <String>['Autor', 'Fecha', 'Titulo'];
  static const List<String> tipo_producto = <String> ['Pelicula', 'Libro'];

  static List<IEstrategiaBusqueda> _estrategiasBusqueda = <IEstrategiaBusqueda> [EstrategiaAutor(), EstrategiaFecha(), EstrategiaTitulo()];



  int _estrategiaSeleccionada = 0;
  bool _buscarPelicula = false;

  late final Contexto _contexto = Contexto(_gestor, _estrategiasBusqueda[_estrategiaSeleccionada]);


  _cambiarRol (String? nuevoRol) {

    setState(() {
      this._rolSeleccionado = nuevoRol!;
    });

  }

  void _cambiarEstrategia(int index) {
    setState(() {
      _estrategiaSeleccionada = index;
      _contexto.setEstrategia(_estrategiasBusqueda[index]);
    });
  }


  Widget _seccionAdministrador() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Contenido del Administrador',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Otros widgets aquí
        ],
      ),
    );
  }

  Widget _seccionUsuario() {
    final TextEditingController _busquedaController = TextEditingController();
    List<Producto> _resultados = [];

    void _realizarBusqueda() async {
      final resultados = await _contexto.buscar( _buscarPelicula, _busquedaController.text);
      setState(() {
        _resultados = resultados;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contenido del Usuario',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text('Selecciona tipo de producto:'),
          DropdownButton<bool>(
            value: _buscarPelicula,
            items: const [
              DropdownMenuItem<bool>(
                value: true,
                child: Text('Película'),
              ),
              DropdownMenuItem<bool>(
                value: false,
                child: Text('Libro'),
              ),
            ],
            onChanged: (bool? nuevoValor) {
              if (nuevoValor != null) {
                setState(() {
                  _buscarPelicula = nuevoValor;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          const Text('Selecciona estrategia de búsqueda:'),
          DropdownButton<int>(
            value: _estrategiaSeleccionada,
            items: List.generate(busquedas.length, (index) {
              return DropdownMenuItem<int>(
                value: index,
                child: Text(busquedas[index]),
              );
            }),
            onChanged: (int? newIndex) {
              if (newIndex != null) {
                _cambiarEstrategia(newIndex);
              }
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _busquedaController,
            decoration: const InputDecoration(
              labelText: 'Dato a buscar',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _realizarBusqueda,
            child: const Text('Buscar'),
          ),
          const SizedBox(height: 20),
          const Text('Resultados:', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: _resultados.isEmpty
                ? const Center(child: Text('No hay resultados'))
                : ListView.builder(
              itemCount: _resultados.length,
              itemBuilder: (context, index) {
                final producto = _resultados[index];
                return Card(
                  child: ListTile(
                    title: Text(producto.titulo ?? 'Sin título'),
                    subtitle: Text('${producto.autor ?? 'Autor desconocido'} - ${producto.fecha?.year ?? ''}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _rolSeleccionado,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                _cambiarRol(newValue);
              },
              items: usuarios.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 16), // Espacio a la derecha
        ],
      ),
      body: _rolSeleccionado == "Administrador"
          ? _seccionAdministrador()
          : _seccionUsuario(),
    );
  }

}
