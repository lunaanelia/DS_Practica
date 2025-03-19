
package ej1;

public class CarreraCarretera extends Carrera{
    
    public CarreraCarretera(int n_bicis){
        super();
        for(int i = 0; i < n_bicis; i++){
            bicicletas.add(new BicicletaCarretera(i));
        }
    }
}