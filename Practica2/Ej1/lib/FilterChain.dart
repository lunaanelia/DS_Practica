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

  void comporbar (Cuenta cuenta){
    bool correcto = true;

    for (var filter in _filters){
      if(!filter.comprueba(cuenta)){
        correcto = false;
        return;     // Si no se cumple de los filtros se sale del bucle
      }
    }

    if(correcto && _target==null){
      _target!.informaCuenta();
    }
  }
}