
package ej1;

import java.util.ArrayList;

public abstract class Carrera{

    protected ArrayList<Bicicleta> bicicletas;

    public Carrera(){
        bicicletas = new ArrayList<>();
    }

    public ArrayList<Bicicleta> getBicicletas(){
        return bicicletas;
    };
}
