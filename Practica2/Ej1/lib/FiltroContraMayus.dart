import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
class FiltroContraMayus implements Filter{

  @override
  bool comprueba(Cuenta cuenta){

    String texto = cuenta.getContrasenia();

    for(int i=0; i<texto.length; i++){

      /* Segun nuestro amigo daria mayor legibilidad
      final esMayuscula = texto[i].toUpperCase() == texto[i] &&
                    texto[i].toLowerCase() != texto[i];

      if (esMayuscula) return true;
      */
      /*
      * Que este en una espresion regular, de 'A-Z'
      * */
        if (texto[i].toUpperCase() == texto[i] && texto[i].toLowerCase() != texto[i]) {
          return true;
      }
    }

    //Si ha llegado hasta aqui no contiene mayúsculas
    return throw ArgumentError("Error: La contraseña debe contener al menos un caracter en mayúscula");

  }

}