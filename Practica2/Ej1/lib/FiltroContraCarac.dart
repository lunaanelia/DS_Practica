import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
class FiltroContraCarac implements Filter{

  @override
  bool comprueba(Cuenta cuenta) {

    const int TAM_MIN = 8;

    // Perfectivo --> quitar la cadena de getC...le a una funcion directa
    if (cuenta.LenContrasenia() < TAM_MIN) {  // No tiene el tamaño mínimo
      return false;
    }
    else {
      return true;
    }

  }
}