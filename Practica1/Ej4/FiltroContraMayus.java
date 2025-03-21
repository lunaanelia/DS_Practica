//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
class FiltroContraMayus implements Filter{

    @Override
    public boolean comprueba(Cuenta cuenta){

        String texto=cuenta.getContrasena();
    
        for(int i=0; i<texto.length(); i++){
            if( Character.isUpperCase(texto.charAt(i)) )
                return true;
        }

        //Si ha llegado hasta aqui no contiene mayúsculas
        System.out.printf("\033[0;31m \u0058 Error:\033[0m La contraseña debe contener al menos un caracter en mayúscula\n\n");
        return false;

    }

}

