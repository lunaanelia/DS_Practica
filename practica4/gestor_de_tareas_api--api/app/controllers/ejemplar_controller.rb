# EL INDEX SEGURAMENTA HAYA QUE CAMBIARLO CUANDO SEPAMOS LO QUE HACE

class EjemplarController < ApplicationController
   
    def index
        if params[:id].present?
            @ejemplar = Ejemplar.where(id: params[:id])
        else
            @ejemplar = Ejemplar.all
        end
        
        render json: @ejemplar
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

    def usuario_params
        params.require(:ejemplar).permit(:producto, :disponible)
    end
end
