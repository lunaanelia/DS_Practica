
package ej1;

import java.util.ArrayList;

public abstract class Carrera implements Runnable{

    protected ArrayList<Bicicleta> bicicletas;
    protected double bicis_retirar;

    public Carrera(double bicis_retirar){
        bicicletas = new ArrayList<>();
        this.bicis_retirar = bicis_retirar;
    }

    // public ArrayList<Bicicleta> getBicicletas(){
    //     return bicicletas;
    // };

    // método que retira del array bicicletas las bicicletas correspondientes
    public void retirarBicicletas(){

        int a_retirar = (int) (bicis_retirar * bicicletas.size());

        for (int i = 0; i < a_retirar; i++) {
            bicicletas.remove(bicicletas.size() - 1);
        }
    }

    // método que especifica la tarea a realizar por las hebras
    // public void run() {
        
    //     System.out.println("Iniciando carrera con " + bicicletas.size() + " bicicletas.");

    //     retirarBicicletas();

    //     System.out.println("Carrera finalizada. Bicicletas restantes: " + bicicletas.size());
    // }

    public abstract void run();
    
    // TimerTask task1 = new TimerTask() {
    //     public void run() {
    //         System.out.println("Task 1 executed!");
    //     }
    // };
    
}
