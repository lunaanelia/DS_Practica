
 
import java.util.ArrayList;

public abstract class Carrera implements Runnable{

    protected ArrayList<Bicicleta> bicicletas;
    protected double bicis_retirar;
    protected String tipo_carrera;

    public Carrera(double bicis_retirar, String tipo){
        this.bicicletas = new ArrayList<>();
        this.bicis_retirar = bicis_retirar;
        this.tipo_carrera = tipo;
    }

    // Método que retira del array bicicletas las bicicletas correspondientes
    public void retirarBicicletas(){

        int a_retirar = (int) (bicis_retirar * bicicletas.size());

        for (int i = 0; i < a_retirar; i++) {
            if(!bicicletas.isEmpty())   bicicletas.remove(bicicletas.size() - 1);
        }
    }

    // Método abstracto heredado ( Runnable.run ) 
    @Override
    public void run(){

        final int TIEMPO_MAX = 60000;
        
        long t_inicio = System.currentTimeMillis();
        
        //Mientras que no se superen los 60 seg
        while(System.currentTimeMillis() - t_inicio < TIEMPO_MAX){
          
            //Las bicicletas están corriendo
            System.out.println("\tCarrera de " + tipo_carrera + " corriendo.\t" + bicicletas.size() + " bicicletas");

            try {   // Pausa de 10 segundos

                Thread.sleep(10000); 

            } catch (InterruptedException e) {  // Manejar la excepción: sale del bucle si la hebra es interrumpida

                System.out.println("Carrera interrumpida.");
                break; 
            }
        }

        retirarBicicletas();
        System.out.println("Carrera de " + tipo_carrera +" finalizada. Bicicletas restantes: " + bicicletas.size());
    }
}
