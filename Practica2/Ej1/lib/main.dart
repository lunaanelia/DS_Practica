import 'package:ejercicio1_mantenimiento/ChatTarget.dart';
import 'package:ejercicio1_mantenimiento/Cliente.dart';
import 'package:ejercicio1_mantenimiento/FilterManager.dart';
import 'package:ejercicio1_mantenimiento/FiltroContraCarac.dart';
import 'package:ejercicio1_mantenimiento/FiltroContraMayus.dart';
import 'package:ejercicio1_mantenimiento/FiltroContraNum.dart';
import 'package:ejercicio1_mantenimiento/FiltroCorreo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creados usuarios',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      ),
      home: const MyHomePage(title: 'Programa creador de usuarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // late para cuando sean inicializazados mas tarde
  late ChatTarget chatTarget;// = ChatTarget();
  late FilterManager filterManager;// = FilterManager(chatTarget);

  TextEditingController contrasenia = TextEditingController();
  TextEditingController correo = TextEditingController();
  String resultado = "";

  // NO se pueden crear directemnte en el _homeState, por lo
  // tanto lo ponesmo para inicializarlos
  // Solo se crea un vez
  @override
  void initState (){
    super.initState();
    chatTarget = ChatTarget();
    filterManager = FilterManager(chatTarget);
    filterManager.addFilter(FiltroCorreo());
    filterManager.addFilter(FiltroContraCarac());
    filterManager.addFilter(FiltroContraMayus());
    filterManager.addFilter(FiltroContraNum());
  }

void _crearCuenta(){

      Cliente cliente = Cliente (filterManager);

      setState(() {
        // mira que no esten vacios cooreos y contraseña antes
        if (correo.text.isEmpty || contrasenia.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            // mensaje de alerta como en js
            SnackBar(content: Text('Algun campo esta incompleto')),
          );
          resultado = "";
        }else{
          resultado = cliente.crearCuenta(correo.text, contrasenia.text);
          correo.clear();
          contrasenia.clear();
        }
      });

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: correo,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contrasenia,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _crearCuenta,
              child: Text('Crear'),
            ),
            SizedBox(height: 24),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}
