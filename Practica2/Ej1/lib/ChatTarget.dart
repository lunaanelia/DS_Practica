import 'package:ejercicio1_mantenimiento/Correos.dart';

class ChatTarget{
  final Correos _correos = Correos();
  String informaCuenta(String correo){
    // SI se hay llamado es porque todo esta corecto
    _correos.addCorreo(correo);
    return " La cuenta ha sido configurada con éxicto";
  }
}