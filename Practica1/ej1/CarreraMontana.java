
package ej1;

import java.util.ArrayList;

public class CarreraMontana extends Carrera{
    
    public CarreraMontana(){
        bicicletas = new ArrayList<Bicicleta>();
    }

    @Override
    public ArrayList<Bicicleta> getBicicletas(){
        return bicicletas;
    }
}