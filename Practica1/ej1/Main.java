
package ej1;

public class Main {

    public static void main(String[] args) {

        int N = (int) (Math.random() * 100) + 1;  // Número de bicicletas aleatorio [0, 100]

        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        // Carrera carreraMontana = factoriaMontana.crearCarrera(N);
        // Carrera carreraCarretera = factoriaCarretera.crearCarrera(N);
                

        Thread carreraMontana   = new Thread (factoriaMontana.crearCarrera(N));
        Thread carreraCarretera = new Thread (factoriaCarretera.crearCarrera(N));

        // Timer timer = new Timer();
        
        // timer.schedule(carreraMontana.start(), 5000);

        carreraMontana.start();
        carreraCarretera.start();


        // System.out.println("Carrera de Montaña con " + carreraMontana.getBicicletas().size() + " bicicletas.");
        // System.out.println("Carrera de Carretera con " + carreraCarretera.getBicicletas().size() + " bicicletas.");

        // System.out.println("Carrera Montaña bicis retiradas " + carreraMontana.getBicicletas().size());
        // System.out.println("Carrera Carretera bicis retiradas " + carreraCarretera.getBicicletas().size());
    }
}