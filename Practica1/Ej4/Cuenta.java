class Cuenta{

    private String correo, contrasena;

    public Cuenta(String cor, String con){
        this.correo=cor;
        this.contrasena=con;
    }

    public String getCorreo(){
       return correo; 
    }

    public String getContrasena(){
        return contrasena;
    }

    public void setCorreo(String c){
        this.correo=c;
    }

    public void setContrasena(String c){
        this.contrasena=c;
    }

}