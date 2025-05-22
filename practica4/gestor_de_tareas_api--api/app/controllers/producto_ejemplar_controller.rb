class ProductoEjemplarController < ApplicationController

    def index
<<<<<<< HEAD
        @productos= Producto.all

        @productos= @productos.where(titulo: params[:titulo])if params[:titulo].present?
        @productos= @productos.where()

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
=======
        if params[:id].present?
            @producto
end
>>>>>>> fd23dc02173136f5295f5a74a7d44262ebe18640
