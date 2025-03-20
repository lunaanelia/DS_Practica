package individual;

//adaptee
public class ServicioMillas {
    
    private double distanciaMillas;

    public ServicioMillas(double distancia){
        this.distanciaMillas = distancia;
    }

    public double obtenerDistanciaMillas(){
        return distanciaMillas;
    }
}
