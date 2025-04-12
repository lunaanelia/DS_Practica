import 'Correos.dart';
import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo implements Filter{
  static String _arroba = "@";
  static final String _gmail="gmail.com";
  static final String _hotmail="hotmail.com";
  final Correos _correos = Correos();

  bool dominio_func(String cad, String dominio){

    for(int i=0; i<cad.length; i++){
      if(cad[i]!=dominio[i])
        return false;
    }

    return true;    //Si ha llegado hasta aqui el dominio es correcto
  }

  bool _contieneArroba(String texto){
    // Cmabiamos encotrado a valido para mayor lejibilidad
    bool valido = texto.contains(_arroba);
    String error = "";

    if(!valido){
      error = "Error: Debes incluir texto antes del @\n";

    }else if(texto[0] == _arroba){  // en el caso de que si este contenido comporbamso que no este en la posicion 0
        error = "Error: La @ no puede estar al inicio\n";
        valido = false;  // no seria valido
    }

    // Si tenemos algun error lo mandamos
    if(!valido){
      throw ArgumentError(error);
    }

    return valido;
  }

  bool _contieneDominio(String texto){
    // OJO no se si esto esta bien
    // devuleve trues si texto termina en lo hotmail o gmail
    return texto.endsWith(_hotmail) || texto.endsWith(_gmail);
  }

  // devuelve false si ya esta el correo
  bool _correoNoAniadido (String correo){
    return !(_correos.existeCorreo(correo));
  }


  @override
  // Creo que esta mas comlicado de lo que era.
  bool comprueba(Cuenta cuenta){
    bool valido = true;
    String error = "";
    String texto = cuenta.getCorreo();

    if (_correoNoAniadido(texto)){  // Si el correo no ha sido añadido comprobamos los sigientes errores
      try{
        valido = _contieneArroba(texto);
      }catch(e){
        error += e.toString();
      }
      try{
        valido = _contieneDominio(texto);
      }catch(e){
        //valido = false;
        error += e.toString();
      }
    }
    else{
      //valido = false;
      error = "Error: Este correo ya existe\n";
    }

    if(!valido){
      throw ArgumentError(error);
    }

    return valido;

    /*bool enc = false; //true cuando encuentra el @

    String texto=cuenta.getCorreo();

    for(int i=0; i<texto.length && !enc; i++){
      if(texto[i]==_arroba){
        enc=true;
        if(i==0){
          return throw ArgumentError("Error: Debes incluir texto antes del @");  //Informa del error
        }
        else{   //Comprueba el numero de caracteres que le quedan y dependiendo de eso ve si el dominio es gmail, hotmail o esta mal

          int num_car= texto.length - i - 1;
          String dominio= texto.substring(i+1);


          if( num_car==9 ){
            if ( dominio_func(dominio, _gmail) )
              return true;
          }
          else if( num_car==11 ){
            if ( dominio_func(dominio, _hotmail) )
              return true;
          }

          //Si ha llegado hasta aqui el dominio está mal
          return throw ArgumentError("Error:No es un dominio de correo válido");
        }

      }
    }

    //Si ha llegado hasta aqui es que no contiene un @
    return throw ArgumentError("Error:No es un formato válido de correo");
  }*/

  }
}