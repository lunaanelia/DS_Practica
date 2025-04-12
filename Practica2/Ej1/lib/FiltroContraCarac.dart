import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
class FiltroContraCarac implements Filter{
  static const int _tamMin = 8;

  @override
  MapEntry <String, bool> comprueba(Cuenta cuenta) {
    String result = "Longitud mayor o igual a 8 :";
    bool correcto = true;

    if (cuenta.LenContrasenia() < _tamMin) {  // No tiene el tamaño mínimo
      result += "Incorrecto.";
      correcto = false;
    }
    else {
      result += "Correcto.";
      correcto = true;
    }

    return MapEntry(result, correcto);
  }
}