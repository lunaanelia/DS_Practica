
import 'package:ej2/strategy.dart';

class Context{

  Strategy estrategia;

  Context(this.estrategia);

  contextAlgorithm(){
    this.estrategia.AlgorithmInterface(text);
  }
}