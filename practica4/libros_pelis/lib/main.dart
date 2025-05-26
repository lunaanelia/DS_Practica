import 'package:flutter/material.dart';
import 'package:libros_pelis/i_estrategia_busqueda.dart';
import 'package:libros_pelis/gestor.dart';
import 'package:libros_pelis/contexto.dart';
import 'package:libros_pelis/estrategia_autor.dart';
import 'package:libros_pelis/estrategia_fecha.dart';
import 'package:libros_pelis/estrategia_titulo.dart';


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

  static List<IEstrategiaBusqueda> estrategiasBusqueda = <IEstrategiaBusqueda> [EstrategiaAutor(), EstrategiaFecha(), EstrategiaTitulo()];


  // static Contexto contexto (_gestor, estrategiasBusqueda[0]);


  _cambiarRol (String? nuevoRol) {

    setState(() {
      this._rolSeleccionado = nuevoRol!;
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Contenido del Usuario',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Otros widgets aquí
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
