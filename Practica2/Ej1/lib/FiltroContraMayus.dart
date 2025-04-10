import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
class FiltroContraMayus implements Filter{

  @override
  bool comprueba(Cuenta cuenta){

    String texto=cuenta.getContrasena();

    for(int i=0; i<texto.length; i++){
        if (texto[i].toUpperCase() == texto[i] && texto[i].toLowerCase() != texto[i]) {
          return true;

      }
    }

    //Si ha llegado hasta aqui no contiene mayúsculas
    return throw ArgumentError("Error: La contraseña debe contener al menos un caracter en mayúscula");

  }

}