
package ej1;

public class Main {
    public static void main(String[] args) {

    // public static void main(String[] args){

    //     FactoriaCarreraYBicicleta factoriaC = new FactoriaCarretera();
    //     FactoriaCarreraYBicicleta factoriaM = new FactoriaMontana();

    //     Carrera carreraC = factoriaC.crearCarrera(5);
    //     Carrera carreraM = factoriaM.crearCarrera(5);
      
    //     // Cliente cliente = new Cliente("Juan", 1);
    //     // carrera.addBicicleta(bicicleta);
    //     // carrera.addCliente(cliente);
    // }


        int N = 100;  // Número de bicicletas

        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();

        Carrera carreraMontana = factoriaMontana.crearCarrera(N);
        Carrera carreraCarretera = factoriaCarretera.crearCarrera(N);
                

        System.out.println("Carrera de Montaña con " + carreraMontana.getBicicletas().size() + " bicicletas.");
        System.out.println("Carrera de Carretera con " + carreraCarretera.getBicicletas().size() + " bicicletas.");

    }
}