class FilterManager{

    private FilterChain filterchain;

    public FilterManager(ChatTarget target){
        filterchain=new FilterChain();
        filterchain.setTarget(target);
    }

    public void addFilter(Filter filter){
        filterchain.addFilter(filter);
    }

    public void haceCuenta(Cuenta cuenta){
        filterchain.comprueba(cuenta);
    }

}

