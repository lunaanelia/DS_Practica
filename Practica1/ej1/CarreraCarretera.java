
package ej1;

import java.util.ArrayList;

public class CarreraCarretera extends Carrera{
    
    public CarreraCarretera(){
        bicicletas = new ArrayList<Bicicleta>();
    }

    @Override
    public ArrayList<Bicicleta> getBicicletas(){
        return bicicletas;
    }
}