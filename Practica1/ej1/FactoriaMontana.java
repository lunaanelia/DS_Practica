
package ej1;

public class FactoriaMontana implements FactoriaCarreraYBicicleta{

    public Carrera crearCarrera(){
        return new CarreraMontana();
    }

    public Bicicleta crearBicicleta(int id){
        return new BicicletaMontana(id);
    }
}