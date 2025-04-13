import 'dart:convert';
import 'package:ej2/basico.dart';
import 'package:ej2/expansion.dart';
import 'package:ej2/traduccion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ej2/context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica 2. Ejercicio 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const MyHomePage(title: 'Hugging Face'),
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
  final String _archivoToken = "huggingface.txt";  // archivo del que se obtiene el token

  final TextEditingController _controller = TextEditingController(); // controlador del input de texto

  late MyContext _contexto;  // contexto del patrón Estrategia

  Map<String, String> _modelos = {}; // Diccionario que almacena los modelos disponibles (tipo: URL)
  String? _modeloSeleccionado; // Modelo seleccionado por el usuario

  String _respuesta = ''; // Respuesta dada por el modelo
  bool _isLoading = false; // Está a true mientras se espera la respuesta del modelo

  @override
  void initState() {
    super.initState();
    _cargarModelos();  // al inicio de la ejecución se leen los modelos
  }

  // Para cargar el archivo de los modelos al inicio de la ejecución
  Future<void> _cargarModelos() async {
    final contenido = await rootBundle.loadString('modelos.json');
    final jsonData = jsonDecode(contenido);

    setState(() {
      _modelos = {
        'Básico': jsonData['Básico'],
        'Traductor': jsonData['Traductor'],
        'Expandir': jsonData['Expandir'],
      };

      // Al inicio, por defecto se elige el modelo básico
      _modeloSeleccionado = 'Básico';
      _contexto = MyContext(Basico(_archivoToken, _modelos['Básico']!));
    });
  }

  // Enviar texto intropducido por el usuario al modelo
  void _enviar() async {
    setState(() {
      _isLoading = true;
      _respuesta = '';
    });

    final resultado = await _contexto.ejecutar(_controller.text);

    setState(() {
      _respuesta = resultado;
      _isLoading = false;
    });
  }

  // Para actualizar la estrategia (modelo) elegido por el usuario
  void _cambiarEstrategia(String clave) {

    setState(() {

      _modeloSeleccionado = clave;
      final modelo = _modelos[clave]!;

      if (clave == 'Básico') {
        _contexto.setStrategy(Basico(_archivoToken, modelo));
      } else if (clave == 'Traductor') {
        _contexto.setStrategy(Traduccion(_archivoToken, modelo));
      } else if (clave == 'Expandir') {
        _contexto.setStrategy(Expansion(_archivoToken, modelo));
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    // Muestra una animación de carga mientras se lee el archivo de los modelos
    if (_modeloSeleccionado == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _modeloSeleccionado,
              items: _modelos.keys.map((clave) {
                return DropdownMenuItem<String>(
                  value: clave,
                  child: Text(clave),
                );
              }).toList(),
              onChanged: (value) {
                  _cambiarEstrategia(value!);
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Escribe tu mensaje',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviar,
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Text(
              _respuesta,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
