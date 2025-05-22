class ProductoAutorController < ApplicationController

    def index
        if params[:producto_id].present?
            @ejemplares = Ejemplar.where(producto_id: params[:producto_id])
        else
            @ejemplares = Ejemplar.all
        end

        render json: @ejemplares
    end

    def create
        @ejemplar = Ejemplar.new(ejemplar_params)

        if @ejemplar.save
            render json: @ejemplar, status: :created
        else
            render json: @ejemplar.errors, status: :unprocessable_entity
        end
    end

    def update
        @ejemplar = Ejemplar.find(params[:id])
        if @ejemplar.update(ejemplar_params)
            render json: @ejemplar
        else
            render json: @ejemplar.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @ejemplar = Ejemplar.find(params[:id])
        if @ejemplar.destroy
            head :ok
        else
            render json: { error: "No se pudo eliminar" }, status: :unprocessable_entity
        end
    end

  private

    def ejemplar_params
        params.require(:ejemplar).permit(:producto_id, :disponible)
    end
end


end
