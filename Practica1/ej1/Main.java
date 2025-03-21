
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

        carreraMontana.run();
        carreraCarretera.run();

        System.out.println("Carrera de Carretera finalizada. Bicicletas restantes: " + carreraCarretera.bicicletas.size());
        System.out.println("Carrera de Montaña finalizada. Bicicletas restantes: " + carreraMontana.bicicletas.size());
    }
}