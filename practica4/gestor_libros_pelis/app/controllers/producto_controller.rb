class ProductoController < ApplicationController

    def index
        @productos= Producto.all

        @productos= @productos.where(es_peli: true)if params[:es_peli]=="true" #Para filtrar por peli
        @productos= @productos.where(es_peli: false)if params[:es_peli]=="false" #Para filtrar por libro

        @productos= @productos.where(titulo: params[:titulo])if params[:titulo].present? #Filtro por titulo
        @productos= @productos.where(autor: params[:autor])if params[:autor].present?   #Filtro por autor
        @productos= @productos.where(fecha: params[:fecha])if params[:fecha].present?   #Filtro por fecha        

        render json: @productos
    end
    
    def create
        @producto = Producto.new(producto_params)
        if @producto.save
            render json: @producto, status: :created
        else
            render json: @producto.errors, status: :unprocessable_entity
        end
    end

    def update
        @producto = Producto.new(producto_params)
        if @producto.update(producto_params)
            render json: @producto
        else
            @producto = Producto.find(params[:id])
            render json: @producto.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @producto = Producto.find(params[:id])
        if @producto.destroy
            head :ok
        else
            render json: { error: "Error al eliminar"}, status: :unprocessable_entity
        end
    end


    private
    def producto_params
        params.require(:producto).permit(:titulo, :fecha, :es_peli)
    end

end