
package ej1;

public class CarreraMontana extends Carrera{

    // public double bicis_retirar = 0.2;
    
    public CarreraMontana(int n_bicis){
        super(0.2);
        for(int i = 0; i < n_bicis; i++){
            bicicletas.add(new BicicletaMontana(i));
        }
    }

    // public void retirarBicicletas(double bicis_retirar){

    //     super.retirarBicicletas(bicis_retirar);
    // }

    public void run() {

        long duracion = 60000;
        
        System.out.println("Iniciando Carrera de Montaña con " + bicicletas.size() + " bicicletas.");
        

        try {
            Thread.sleep(duracion); // Corrección: Thread.sleep() en lugar de this.sleep()
        } catch (InterruptedException e) {
            System.err.println("Carrera interrumpida.");
            Thread.currentThread().interrupt(); // Restablece el estado de interrupción del hilo
        }

        retirarBicicletas();

        System.out.println("Carrera de Montaña finalizada. Bicicletas restantes: " + bicicletas.size());
    }

}