import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
class FiltroContraMayus implements Filter{

  @override
  MapEntry <String, bool> comprueba(Cuenta cuenta){

    String texto = cuenta.getContrasenia();
    String result = "Al menos una mayúscula: ";
    bool correcto = false;

    for(int i=0; i<texto.length && !correcto; i++){
        if(RegExp(r'[A-Z]').hasMatch(texto)){ //Comprueba que tenga un caracter entre A-Z
          correcto = true;
          result += "Correcto.";
      }
    }

    if (!correcto){
      result += "Incorrecto.";
    }

    return MapEntry(result, correcto);
  }

}