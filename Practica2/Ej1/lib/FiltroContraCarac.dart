import 'Filter.dart';

//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
class FiltroContraCarac implements Filter{

  @override
  bool comprueba(Cuenta cuenta) {

    const int TAM_MIN = 8;

    if (cuenta.getContrasena.length < TAM_MIN) {  // No tiene el tamaño mínimo
      return ("Error: La contraseña debe contener al menos 8 caracteres");
    } else {
      return true;
    }
  }
}