import 'FilterManager.dart';
import 'Cuenta.dart';
class Cliente {

  FilterManager? _filterManager;

  Cliente (FilterManager f){
    _filterManager = f;
  }

  void crearCuenta(String correo, String contra){
    Cuenta cuenta = new Cuenta(correo, contra);
    _filterManager!.haceCuenta(cuenta);
  }


}