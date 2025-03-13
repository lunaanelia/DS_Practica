
package ej1;

public class Main{

    public static void main(String[] args){

        FactoriaCarreraYBicicleta factoria = new FactoriaCarretera();

        Carrera carrera = factoria.crearCarrera();
        Bicicleta bicicleta = factoria.crearBicicleta();

        // Cliente cliente = new Cliente("Juan", 1);
        // carrera.addBicicleta(bicicleta);
        // carrera.addCliente(cliente);
    }

}