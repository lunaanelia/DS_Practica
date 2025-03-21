import java.util.List;
import java.util.ArrayList;

class FilterChain{

    private List<Filter> filters=new ArrayList<>();
    private ChatTarget target;

    public void addFilter(Filter filter){
        filters.add(filter);
    }

    public void setTarget(ChatTarget t){
        this.target= t;
    }

    public void comprueba(Cuenta cuenta){
        
        boolean correcto=true;
        
        for(Filter filter: filters){
            if(!filter.comprueba(cuenta)){
                correcto=false;
                break;                  //Si no cumple uno de los filtros se sale del bucle
            }
        }
       
        if(correcto && target!=null){   
            target.informaCuenta();
        }
    }

}


