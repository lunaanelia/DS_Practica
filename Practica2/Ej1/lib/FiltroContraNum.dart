import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
class FiltroContraNum implements Filter{

  @override
  bool comprueba(Cuenta cuenta){

    String texto=cuenta.getContrasena();

    for(int i=0; i<texto.length; i++){
      if (RegExp(r'\d').hasMatch(texto[i]))   //El /d comprueba que es un digito
        return true;
    }

    //Si ha llegado hasta aqui no contiene caracteres numéricos
    print("Error: La contraseña debe contener al menos un caracter numérico");
  }

}