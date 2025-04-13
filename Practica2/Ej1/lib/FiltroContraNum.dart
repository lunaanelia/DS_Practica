import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
class FiltroContraNum implements Filter{

  @override
  MapEntry <String, bool> comprueba(Cuenta cuenta){

    String texto = cuenta.getContrasenia();
    String result = "Al menos un número: ";
    bool correcto = false;

    for(int i=0; i<texto.length && !correcto; i++){
      /*Perfection --> expresion regular simplica*/
      if (RegExp(r'\d').hasMatch(texto[i])){   //El /d comprueba que es un digito
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