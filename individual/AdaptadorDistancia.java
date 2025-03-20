package individual;


//adapter
public class AdaptadorDistancia implements IServicioKilometros{

    private ServicioMillas adaptado;

    public AdaptadorDistancia(ServicioMillas adaptee){
        this.adaptado = adaptee;
    }

    @Override
    public double obtenerDistanciaKilometros(){

        double milla = 0.621371; //Un kilometro equivale a 0,621371 millas

        return(adaptado.obtenerDistanciaMillas()/milla);
    }
}