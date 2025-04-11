import 'package:ej2/basico.dart';
import 'package:ej2/traduccion.dart';
import 'package:ej2/expansion.dart';
import 'package:flutter/material.dart';
import 'package:ej2/context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  final TextEditingController _controller = TextEditingController();

  String _modeloSeleccionado = 'facebook/bart-large-cnn';
  String _respuesta = '';
  bool _isLoading = false;

  late MyContext contexto;

  @override
  void initState() {
    super.initState();
    contexto = MyContext(Basico(archivoToken, "facebook/bart-large-cnn"));


    final List<String> _modelos = [
      "facebook/bart-large-cnn",
      "Helsinki-NLP/opus-mt-en-es",
      "facebook/blenderbot-400M-distill"
    ];


  }

  final String archivoToken = "huggingface.txt";





  void _enviar() async {
    setState(() {
      _isLoading = true;
      _respuesta = '';
    });

    final resultado = await contexto.ejecutar(_controller.text);

    setState(() {
      _respuesta = resultado;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _modeloSeleccionado,
              items: _modelos.map((modelo) {
                return DropdownMenuItem<String>(
                  value: modelo,
                  child: Text(modelo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _modeloSeleccionado = value!;
                  if (_modeloSeleccionado == "facebook/bart-large-cnn") {
                    contexto.setStrategy(Basico(archivoToken, "facebook/bart-large-cnn"));
                  }
                  else if (_modeloSeleccionado == "Helsinki-NLP/opus-mt-en-es"){
                    contexto.setStrategy(Traduccion(archivoToken,"Helsinki-NLP/opus-mt-en-es"));
                  }

                  else if (_modeloSeleccionado == "facebook/blenderbot-400M-distill")  {
                    contexto.setStrategy(Expansion(archivoToken, "facebook/blenderbot-400M-distill"));
                  }
                });
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