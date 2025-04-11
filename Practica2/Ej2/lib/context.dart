import 'package:ej2/strategy.dart';

class MyContext {
  Strategy estrategia;

  MyContext(this.estrategia);

  Future<String> ejecutar(String input) async {
    return await estrategia.AlgorithmInterface(input);
  }

  void setStrategy(Strategy nuevaEstrategia) {
    estrategia = nuevaEstrategia;
  }
}
