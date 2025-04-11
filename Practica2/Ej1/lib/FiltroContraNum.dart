import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
class FiltroContraNum implements Filter{

  @override
  bool comprueba(Cuenta cuenta){

    String texto=cuenta.getContrasenia();

    for(int i=0; i<texto.length; i++){
      /*Perfection --> expresion regular simplica*/
      if (RegExp(r'\d').hasMatch(texto[i]))   //El /d comprueba que es un digito
        return true;
    }

    //Si ha llegado hasta aqui no contiene caracteres numéricos
    return false;
  }

}