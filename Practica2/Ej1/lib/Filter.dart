import 'Cuenta.dart';

abstract class  Filter{
  MapEntry <String, bool> comprueba(Cuenta cuenta);
}
