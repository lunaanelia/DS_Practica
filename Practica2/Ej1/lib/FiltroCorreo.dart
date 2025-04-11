import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo implements Filter{


  bool dominio_func(String cad, String dominio){

    for(int i=0; i<cad.length; i++){
      if(cad[i]!=dominio[i])
        return false;
    }

    return true;    //Si ha llegado hasta aqui el dominio es correcto

  }

  @override
  bool comprueba(Cuenta cuenta){

    bool enc=false; //true cuando encuentra el @

    String texto=cuenta.getCorreo();

    for(int i=0; i<texto.length && !enc; i++){
      if(texto[i]=='@'){
        enc=true;
        if(i==0){
          return throw ArgumentError("Error: Debes incluir texto antes del @");  //Informa del error
        }
        else{   //Comprueba el numero de caracteres que le quedan y dependiendo de eso ve si el dominio es gmail, hotmail o esta mal

          int num_car= texto.length - i - 1;
          String dominio= texto.substring(i+1);
          final String gmail="gmail.com";
          final String hotmail="hotmail.com";

          if( num_car==9 ){
            if ( dominio_func(dominio,gmail) )
              return true;
          }
          else if( num_car==11 ){
            if ( dominio_func(dominio,hotmail) )
              return true;
          }

          //Si ha llegado hasta aqui el dominio está mal
          return throw ArgumentError("Error:No es un dominio de correo válido");
        }

      }
    }

    //Si ha llegado hasta aqui es que no contiene un @
    return throw ArgumentError("Error:No es un formato válido de correo");
  }

}