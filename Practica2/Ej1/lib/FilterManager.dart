import 'ChatTarget.dart';
import 'Filter.dart';
import 'FilterChain.dart';
import 'Cuenta.dart';

class FilterManager{
  FilterChain _filterChain = FilterChain();

  FilterManager(ChatTarget target){
    _filterChain.setTarget(target);
  }

  void addFilter(Filter filter){
    _filterChain.addFilter(filter);
  }

  String haceCuenta(Cuenta cuenta){
    return _filterChain.comprobar(cuenta);
  }

}