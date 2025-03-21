
package ej1;

import java.util.ArrayList;

public abstract class Carrera implements Runnable{

    protected ArrayList<Bicicleta> bicicletas;
    protected double bicis_retirar;

    public Carrera(double bicis_retirar){
        bicicletas = new ArrayList<>();
        this.bicis_retirar = bicis_retirar;
    }

    public ArrayList<Bicicleta> getBicicletas(){
        return bicicletas;
    }

    // método que retira del array bicicletas las bicicletas correspondientes
    public void retirarBicicletas(){

        int a_retirar = (int) (bicis_retirar * bicicletas.size());

        for (int i = 0; i < a_retirar; i++) {
            if(!bicicletas.isEmpty())   bicicletas.remove(bicicletas.size() - 1);
        }
    }

    public void run(){

        final int TIEMPO_MAX = 60000;

        // esto creo que va en carrera
        // Thread hilo_carretera = new Thread ();
        
        long t_inicio = System.currentTimeMillis();
        
        //mientras que no se superen los 60 seg
        while(System.currentTimeMillis() - t_inicio < TIEMPO_MAX){
            //corre cada bicicleta y muestro esta corriendo estas bicis
        

            System.out.println("Carrera de Carretera corriendo. " + bicicletas.size());
            System.out.println("Carrera de Montaña corriendo. " + bicicletas.size());

            //que duerma 1 seg
            // hilo_carretera.sleep(1000);
            // Thread.sleep(10);

            try {
                Thread.sleep(10000); // Pausa de 10 segundo
            } catch (InterruptedException e) {
                System.out.println("Carrera interrumpida.");
                break; // Sale del bucle si la hebra es interrumpida
            }
        }
        retirarBicicletas();
    }
}
