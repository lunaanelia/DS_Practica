import 'FilterManager.dart';
import 'Cuenta.dart';
class Cliente {

  FilterManager? _filterManager;

  Cliente (FilterManager f){
    _filterManager = f;
  }

  String crearCuenta(String correo, String contra){
    Cuenta cuenta = Cuenta(correo, contra);
    return _filterManager!.haceCuenta(cuenta);
  }


}