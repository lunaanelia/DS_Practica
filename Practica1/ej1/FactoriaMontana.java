
package ej1;

public class FactoriaMontana implements FactoriaCarreraYBicicleta{

    @Override
    public Carrera crearCarrera(int n_bicis){
        return new CarreraMontana(n_bicis);
    }

    @Override
    public Bicicleta crearBicicleta(int id){
        return new BicicletaMontana(id);
    }
}