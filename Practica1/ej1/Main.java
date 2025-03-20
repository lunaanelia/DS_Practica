
package ej1;

import java.util.Timer;
import java.util.TimerTask;


public class Main {

    public static void main(String[] args) {

        Timer timer = new Timer();

        int N = (int) (Math.random() * 100) + 1;  // Número de bicicletas aleatorio [0, 100]

        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        Thread carreraMontana   = new Thread (factoriaMontana.crearCarrera(N));
        Thread carreraCarretera = new Thread (factoriaCarretera.crearCarrera(N));


        TimerTask task1 = new TimerTask() {
            public void run() {
                carreraMontana.start();
            }
        };
        TimerTask task2 = new TimerTask() {
            public void run() {
                carreraCarretera.start();
            }
        };
  
        System.out.println("Iniciando Carrera de Montaña con " + N + " bicicletas.");
        System.out.println("Iniciando Carrera de Carretera con " + N + " bicicletas.");


        timer.schedule(task1, 60000);
        timer.schedule(task2, 60000);
    }
}

        // carreraMontana.start();
        // carreraCarretera.start();

        // System.out.println("Carrera de Montaña con " + carreraMontana.getBicicletas().size() + " bicicletas.");
        // System.out.println("Carrera de Carretera con " + carreraCarretera.getBicicletas().size() + " bicicletas.");

        // System.out.println("Carrera Montaña bicis retiradas " + carreraMontana.getBicicletas().size());
        // System.out.println("Carrera Carretera bicis retiradas " + carreraCarretera.getBicicletas().size());