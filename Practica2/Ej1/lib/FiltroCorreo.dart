import 'Correos.dart';
import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo implements Filter{
  static final String _arroba = "@";
  static final String _gmail="@gmail.com";
  static final String _hotmail="@hotmail.com";
  final Correos _correos = Correos();

  /*bool dominio_func(String cad, String dominio){

    for(int i=0; i<cad.length; i++){
      if(cad[i]!=dominio[i])
        return false;
    }

    return true;    //Si ha llegado hasta aqui el dominio es correcto
  }*/

  MapEntry <String, bool> _contieneArroba(String texto){
    // Cambiamos encotrado a valido para mayor lejibilidad
    bool valido = texto.contains(_arroba);
    String result = "Incluye la arroba: ";

    if(!valido){
      result += "Incorrecto";
    }else{
      result += "Correcto.\n";
      result += "Incluye texto antes de que aparezca la @: ";
      if(texto[0] == _arroba && valido){  // en el caso de que si este contenido comporbamso que no este en la posicion 0
        result += "Incorrecto.";
        valido = false;  // no seria valido
      }
      else{
        result += "Correcto.";
      }
    }
    print(result + valido.toString());
    return MapEntry(result, valido);
  }

  MapEntry<String, bool> _contieneDominio(String texto){
    bool correcto = texto.endsWith(_hotmail) || texto.endsWith(_gmail);
    String result = "Dominio: ";

    if(correcto){
      result += "Correcto.";
    }else {
      result += "Incorrecto.";
    }
    // OJO no se si esto esta bien
    // devuleve trues si texto termina en lo hotmail o gmail
    return MapEntry(result, correcto);
  }

  // devuelve false si ya esta el correo
  bool _correoNoAniadido (String correo){
    return !(_correos.existeCorreo(correo));
  }


  @override
  // Creo que esta mas comlicado de lo que era.
  MapEntry <String, bool> comprueba(Cuenta cuenta){

    bool valido = true;
    String result = "";
    String texto = cuenta.getCorreo();
    MapEntry <String, bool> tmp, tmp1;
    if (!_correoNoAniadido(texto)){  // Si el correo no ha sido añadido comprobamos los sigientes errores
      result = "El correo ya existe.";
      valido = false;
    }
    else{
      tmp = _contieneArroba(texto);
      tmp1 = _contieneDominio(texto);

     valido = tmp.value && tmp1.value;
     result = tmp.key + "\n" + tmp1.key;

    }
    //print(valido);
    return MapEntry(result, valido);

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