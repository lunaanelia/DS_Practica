class ProductoController < ApplicationController

    def index
        @productos= Producto.all

        es_peli = params[:es_peli]
        titulo = params[:titulo]
        autor = params[:autor]
        fecha = params[:fecha]

        titulo = nil if titulo == "null"   #Para que no entre en el where si el valor es null
        autor  = nil if autor == "null"
        fecha  = nil if fecha == "null"

        @productos= @productos.where(es_peli: true) if es_peli=="true" #Para filtrar por peli
        @productos= @productos.where(es_peli: false) if es_peli=="false" #Para filtrar por libro

        @productos= @productos.where(titulo: titulo) if titulo.present? #Filtro por titulo
        @productos= @productos.where(autor: autor) if autor.present?   #Filtro por autor
        @productos= @productos.where(fecha: fecha) if fecha.present?   #Filtro por fecha        

        render json: @productos
    end
    
    def create
    
        #Comprueba si ya existe un producto con el mismo titulo, autor y es_peli 
        existente = Producto.where(
          titulo: producto_params[:titulo],
          autor: producto_params[:autor],
          es_peli: producto_params[:es_peli]
        ).first

        if existente
          render json: { error: "Producto ya existe" }, status: :unprocessable_entity
          return
        end
    
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
        params.require(:producto).permit(:titulo, :autor, :fecha, :es_peli, :descripcion)
    end

end
