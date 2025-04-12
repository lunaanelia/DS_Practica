import 'Filter.dart';
import 'ChatTarget.dart';
import 'Cuenta.dart';

class FilterChain{
  List<Filter> _filters = [];
  ChatTarget? _target;

  void addFilter(Filter filter){
    _filters.add(filter);
  }

  void setTarget(ChatTarget t){
    _target = t;
  }

  void comprobar (Cuenta cuenta){
    bool correcto = true;

    /*for (var filter in _filters){
      if(!filter.comprueba(cuenta)){
        correcto = false;
        return;           // Si no se cumple de los filtros se sale del bucle
      }
    } */

    List<String> errores=[];

    for (var filter in _filters) {
      try {
        correcto = filter.comprueba(cuenta);
      } catch (e) {
        correcto = false;
        errores.add(e.toString());
      }
    }

    if(errores.isNotEmpty) {
      throw ArgumentError("Errores\n ${errores.join(
          '\n')}"); //errores.join('\n') une los errores separándolos por saltos de línea
    }

    if(correcto){
      _target!.informaCuenta(); //Comprueba que el target no sea nulo
    }
  }
}