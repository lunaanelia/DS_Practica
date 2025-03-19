
package ej1;

public class FactoriaCarretera implements FactoriaCarreraYBicicleta{

    @Override
    public Carrera crearCarrera(int n_bicis){
        return new CarreraCarretera(n_bicis);
    }

    @Override
    public Bicicleta crearBicicleta(int id){
        return new BicicletaCarretera(id);
    }
}