
package ej1;

public class FactoriaCarretera implements FactoriaCarreraYBicicleta{

    public Carrera crearCarrera(){
        return new CarreraCarretera();
    }

    public Bicicleta crearBicicleta(int id){
        return new BicicletaCarretera(id);
    }
}