class Cliente{

    private FilterManager filtermanager;

    public Cliente(FilterManager f){
            this.filtermanager=f;
    }

    public void crearCuenta(String correo, String contra){
        Cuenta cuenta=new Cuenta(correo,contra);
        filtermanager.haceCuenta(cuenta);
    }

}
