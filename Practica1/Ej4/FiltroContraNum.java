//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
class FiltroContraNum implements Filter{

    public boolean comprueba(Cuenta cuenta){

        String texto=cuenta.getContrasena();

        for(int i=0; i<texto.length(); i++){
            if( Character.isDigit(texto.charAt(i)) )
                return true;
        }

        //Si ha llegado hasta aqui no contiene caracteres numéricos
        System.out.printf("\033[0;31m \u0058 Error:\033[0m La contraseña debe contener al menos un caracter numérico\n\n");
        return false;
    }

}