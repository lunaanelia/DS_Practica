import 'package:flutter/material.dart';
import 'package:practica3/BankService.dart';
import 'package:practica3/User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 3',
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
      home: const MyHomePage(title: 'Transacciones'),
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
  List<String> operaciones = ['Depositar', 'Retirar', 'Transferencia'];
  List<String>? usuarios = [];
  List<String>? usuarios2 = [];
  List<String> cuentas = [];
  List<String> cuentas2 = [];

  String? oper;
  String? user;
  String? cuenta;
  String? user2;
  String? cuenta2;

  TextEditingController nombre = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  BankService banco = BankService();

  String mensaje = "";

  void _crearCuenta(){
    String n = nombre.text;
    String d = dni.text;
    setState(() {
      if(n.isEmpty || d.isEmpty){
        mensaje = "Hay campos vacios, no se ha podido crear la cuenta";
      }else{
        banco.createAccount(d, n);
        usuarios = banco.getUsers();    // REVISAR PARA QUE SALGA BIEN
        mensaje = "Cuenta creada";
      }
    });
  }

  void _transaccion(){
    double c = double.parse(cantidad.text);
    setState(() {
      if (c==0){
        mensaje = " Debe ingresar una cantidad";
      }
      else if(user==null || cuenta == null){
        mensaje = " Debes seleccionar un usuario y una cuenta";
      }
      else{
        if (oper == 'Depositar'){
          banco.deposit(cuenta!, c);
          mensaje = "Deposito realizado";
        }else if(oper == "Retirar"){
          try{
            banco.withdraw(cuenta!, c);
            mensaje = "Se ha retiado correctamente";
          }catch (e){
            mensaje = "No se ha podido realizar la operacion";
          }

        }
        else if (oper == null){
          mensaje = "Debes seleccionar una operacion";
        }else{
          if(user==null || cuenta == null){
            mensaje = " Debes seleccionar un usuario y una cuenta";
          }
          else{
            try{
              banco.transfer(cuenta!, cuenta2!, c);
              mensaje = "transferencia realizada correctamente";
            }catch(e){
              mensaje = e.toString();
            }
          }
        }
      }
    });
  }

  //@override
  //void initState (){
  //  super.initState();
  //  usuarios = banco.getUsers();    // REVISARLOS PARA QUE SALGA BIEN
 // }

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
      body:Padding(
        padding: const EdgeInsets.all(20.0), // Márgenes alrededor de todo el contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinea los elementos hacia la parte superior
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido hacia la izquierda (opcional)
          children: <Widget>[

            // Crae cuneta
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nombre,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: dni,
                    decoration: InputDecoration(
                      labelText: 'DNI',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _crearCuenta,   // cambiar lo acrear cuenta.
                  child: Text('Crear Cuenta'),
                ),
              ],
            ),

            SizedBox(height: 20),
            // Realizar operaciones
            const Text('Realizar operacion:', style: TextStyle(fontSize: 16),),

            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: user,
                    hint: Text("Seleccione un usuario (from)"),
                    isExpanded: true,
                    onChanged: (String? nuevo) {
                      setState(() {
                        user = nuevo;
                        cuentas = banco.getUserAccounts(user!);
                        cuenta = null; // Resetea cuenta seleccionada al cambiar usuario
                      });
                    },
                    items: usuarios!.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 25), // Espaciado entre los dropdowns
                Expanded(
                  child: DropdownButton<String>(
                    value: cuenta,
                    hint: Text("Seleccione una cuenta (from)"),
                    isExpanded: true,
                    onChanged: (String? nuevo) {
                      setState(() {
                        cuenta = nuevo;
                      });
                    },
                    items: cuentas?.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList() ?? [],
                  ),
                ),
              ],
            ),


            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: user2,
                    hint: Text("Seleccione un usuario (to)"),
                    isExpanded: true,
                    onChanged: (String? nuevo) {
                      setState(() {
                        user2 = nuevo;
                        cuentas2 = banco.getUserAccounts(user2!);
                        cuenta2 = null; // Resetea cuenta seleccionada al cambiar usuario
                      });
                    },
                    items: usuarios!.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 25), // Espaciado entre los dropdowns
                Expanded(
                  child: DropdownButton<String>(
                    value: cuenta2,
                    hint: Text("Seleccione una cuenta (to)"),
                    isExpanded: true,
                    onChanged: (String? nuevo) {
                      setState(() {
                        cuenta2 = nuevo;
                      });
                    },
                    items: cuentas2?.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList() ?? [],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: DropdownButton<String>(
                value: oper,
                hint: Text("Seleccione una opción"),
                onChanged: (String? nuevo) {
                  setState(() {
                    oper = nuevo;
                  });
                },
                items: operaciones.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200, // Puedes ajustar el ancho según lo que necesites
                child: TextField(
                  controller: cantidad,
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 150, // ancho deseado
                child: ElevatedButton(
                  onPressed: _transaccion,
                  child: Text('Finalizar'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('$mensaje'),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
