class Cuenta{

  String _correo = "";
  String _contrasenia= "";

  Cuenta (String cor, String con){
    _contrasenia = con;
    _correo = cor;
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

  void SetContrasenia (String c){
    _contrasenia = c;
  }

}