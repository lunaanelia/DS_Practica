import 'package:ejercicio1_mantenimiento/Correos.dart';

class ChatTarget{
  final Correos _correos = Correos();
  String informaCuenta(String correo){
    // Si se hay llamado es porque todo esta corecto,
    //  por lo que añado el correo y devuelve mensaje todo esta bien
    _correos.addCorreo(correo);
    return " La cuenta ha sido configurada con exito";
  }
}