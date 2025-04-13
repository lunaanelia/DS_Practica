import 'Correos.dart';
import 'Filter.dart';
import 'Cuenta.dart';

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo implements Filter{
  static final String _arroba = "@";
  static final String _gmail="@gmail.com";
  static final String _hotmail="@hotmail.com";
  final Correos _correos = Correos();

  MapEntry <String, bool> _contieneArroba(String texto){
    // Cambiamos encotrado a valido para mayor lejibilidad
    bool valido = texto.contains(_arroba);
    String result = "Incluye la arroba: ";

    if(!valido){
      result += "Incorrecto";
    }
    else{ // Si es valido, vemso que la primera letra no sean el @
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

    return MapEntry(result, correcto);
  }

  // devuelve false si ya esta el correo
  bool _correoNoAniadido (String correo){
    return !(_correos.existeCorreo(correo));
  }


  @override
  MapEntry <String, bool> comprueba(Cuenta cuenta){

    bool valido = true;
    String result = "";
    String texto = cuenta.getCorreo();
    MapEntry <String, bool> tmp, tmp1;
    if (!_correoNoAniadido(texto)){  // Si el correo no ha sido aniadido comprobamos los sigientes errores
      result = "El correo ya existe.";
      valido = false;
    }
    else{
      tmp = _contieneArroba(texto);
      tmp1 = _contieneDominio(texto);

     valido = tmp.value && tmp1.value;  // Si hay uno falso, el resultado sera flaso
     result = tmp.key + "\n" + tmp1.key;

    }

    return MapEntry(result, valido);
  }
}