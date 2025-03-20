
package ej1;

public class CarreraCarretera extends Carrera{
    
    public CarreraCarretera(int n_bicis){
        super(0.1);
        for(int i = 0; i < n_bicis; i++){
            bicicletas.add(new BicicletaCarretera(i));
        }
    }

    public void run() {
 
        // long duracion = 60000;

        // System.out.println("Iniciando Carrera de Carretera con " + bicicletas.size() + " bicicletas.");

        // try {
        //     Thread.sleep(duracion); 
        // } catch (InterruptedException e) {
        //     System.err.println("Carrera interrumpida.");
        //     Thread.currentThread().interrupt(); // Restablece el estado de interrupción del hilo
        // }

        retirarBicicletas();

        System.out.println("Carrera de Carretera finalizada. Bicicletas restantes: " + bicicletas.size());
    }
}