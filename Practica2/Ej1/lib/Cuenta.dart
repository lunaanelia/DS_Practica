class Cuenta{

  String _correo = "";
  String _contrasenia= "";

  Cuenta (String correo, String contrasenia){
    _contrasenia = contrasenia;
    _correo = correo;
  }

  String getCorreo(){
    return _correo;
  }

  String getContrasenia(){
    return _contrasenia;
  }

  void setCorreo(String c){
    _correo = c;
  }

  void setContrasenia (String c){
    _contrasenia = c;
  }

  //Devuelve la longitud del corre
  int lenCorreo(){
    return _correo.length;
  }

  //Devuelve la longitud de la conraseña
  int lenContrasenia(){
    return _contrasenia.length;
  }

}