import 'Filter.dart';

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo implements Filter{


  bool dominio(String cad, String dominio){

    for(int i=0; i<cad.length; i++){
      if(cad[i]!=dominio.charAt(i))
        return false;
    }

    return true;    //Si ha llegado hasta aqui el dominio es correcto

  }

  @override
  bool comprueba(Cuenta cuenta){

    bool enc=false; //true cuando encuentra el @

    String texto=cuenta.getCorreo();

    for(int i=0; i<texto.length && !enc; i++){
      if(texto.charAt(i)=='@'){
        enc=true;
        if(i==0){
          System.out.printf("\033[0;31m \u0058 Error:\033[0m Debes incluir texto antes del @\n\n");  //Informa del error
          return false;
        }
        else{   //Comprueba el numero de caracteres que le quedan y dependiendo de eso ve si el dominio es gmail, hotmail o esta mal

          int num_car= texto.length() - i - 1;
          String dominio= texto.substring(i+1);
          final String gmail="gmail.com";
          final String hotmail="hotmail.com";

          if( num_car==9 ){
            if ( dominio(dominio,gmail) )
              return true;
          }
          else if( num_car==11 ){
            if ( dominio(dominio,hotmail) )
              return true;
          }

          //Si ha llegado hasta aqui el dominio está mal
          System.out.printf("\033[0;31m \u0058 Error:\033[0m No es un dominio de correo válido\n\n");
          return false;
        }

      }
    }

    //Si ha llegado hasta aqui es que no contiene un @
    System.out.printf("\033[0;31m \u0058 Error:\033[0mNo es un formato válido de correo\n");
    return false;
  }

}