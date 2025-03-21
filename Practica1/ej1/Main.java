
package ej1;

public class Main {

    public static void main(String[] args) {

        // Timer timer = new Timer();

        int N = (int) (Math.random() * 100) + 1;  // Número de bicicletas aleatorio [0, 100]

        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        Carrera carreraMontana = factoriaMontana.crearCarrera();
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();

        // creo las bicicletas y las añado
        for(int i = 0; i < N; i++){
            // Bicicleta bici = new BicicletaMontana(i);
            carreraMontana.bicicletas.add(new BicicletaMontana(i));
            carreraCarretera.bicicletas.add(new BicicletaCarretera(i));
        }

        System.out.println("Iniciando Carrera de Montaña con " + N + " bicicletas.");
        System.out.println("Iniciando Carrera de Carretera con " + N + " bicicletas.");


        // Ejecutar cada carrera en su propio hilo
        Thread hiloMontana = new Thread(carreraMontana);
        Thread hiloCarretera = new Thread(carreraCarretera);

        hiloMontana.start();
        hiloCarretera.start();

        try {
            hiloMontana.join(); // Espera a que termine la carrera de montaña
            hiloCarretera.join(); // Espera a que termine la carrera de carretera
        } catch (InterruptedException e) {
            System.out.println("Error: Hilos interrumpidos.");
        }

        System.out.println("Todas las carreras han finalizado.");



        // carreraMontana.run();
        // carreraCarretera.run();

        // System.out.println("Carrera de Carretera finalizada. Bicicletas restantes: " + carreraCarretera.bicicletas.size());
        // System.out.println("Carrera de Montaña finalizada. Bicicletas restantes: " + carreraMontana.bicicletas.size());
    }
}