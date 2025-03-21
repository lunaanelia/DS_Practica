//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
class FiltroContraCarac implements Filter{

    @Override
    public boolean comprueba(Cuenta cuenta) {

        final int TAM_MIN = 8;

        if (cuenta.getContrasena().length() < TAM_MIN) {  // No tiene el tamaño mínimo
            System.out.printf("\033[0;31m \u0058 Error:\033[0m La contraseña debe contener al menos 8 caracteres\n\n"); //\u0058 es el codigo unicode de X
            return false;
        } else {
            return true;
        }
    }

}