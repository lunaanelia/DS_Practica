
public class Main {

    public static void main(String[] args) {

        final int MAX = 300, MIN = 50;
     	int N = (int) (( (MAX-MIN+1) * Math.random()) + MIN);
        

        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        Carrera carreraMontana = factoriaMontana.crearCarrera();
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();


        // Añade las bicicletas a las carreras
        for(int i = 0; i < N; i++){
            carreraMontana.bicicletas.add(new BicicletaMontana(i));
            carreraCarretera.bicicletas.add(new BicicletaCarretera(i));
        }


        System.out.println("Iniciando Carrera de Montaña con " + N + " bicicletas.");
        System.out.println("Iniciando Carrera de Carretera con " + N + " bicicletas.");


        //Cada carrera en un hilo distinto
        Thread hiloMontana = new Thread(carreraMontana);
        Thread hiloCarretera = new Thread(carreraCarretera);

        hiloMontana.start();
        hiloCarretera.start();

        try {   //Espera a que terminen las 2 carreras
            hiloMontana.join(); 
            hiloCarretera.join(); 
        } catch (InterruptedException e) {
            System.out.println("Error: Hilos interrumpidos.");
        }

        System.out.println("Todas las carreras han finalizado.");
    }
}