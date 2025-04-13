import 'package:ej2/strategy.dart';

class MyContext {
  Strategy _estrategia;

  MyContext(this._estrategia);

  Future<String> ejecutar(String input) async {
    return await _estrategia.AlgorithmInterface(input);
  }

  void setStrategy(Strategy nuevaEstrategia) {
    _estrategia = nuevaEstrategia;
  }
}
