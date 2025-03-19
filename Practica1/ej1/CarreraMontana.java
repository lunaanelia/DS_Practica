
package ej1;

public class CarreraMontana extends Carrera{
    
    public CarreraMontana(int n_bicis){
        super();
        for(int i = 0; i < n_bicis; i++){
            bicicletas.add(new BicicletaMontana(i));
        }
    }
}