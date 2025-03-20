package individual;

public class Cliente {
    
    public static void main(String[] args) {
        
        ServicioMillas adaptee = new ServicioMillas(10);
        IServicioKilometros adaptador = new AdaptadorDistancia(adaptee);

        System.out.println("Distancia en KM: " + adaptador.obtenerDistanciaKilometros());
    }
}
