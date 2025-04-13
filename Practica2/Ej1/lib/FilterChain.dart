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

  String comprobar (Cuenta cuenta){

    bool correcto = true;
    String result = "";
    MapEntry <String, bool> tmp;

    for (var filter in _filters) {
      tmp = filter.comprueba(cuenta);
      // Si tenemos un error, ya no es correcto
      if (!tmp.value){
        correcto = false;
      }
      result += tmp.key + "\n";
    }

    if(correcto){
     result += "\n" + _target!.informaCuenta(cuenta.getCorreo());
    }
    else{
      result += "\n La cuenta no ha sido configurada con exito";
    }

    return result;
  }
}