class AutorController < ApplicationController

    def index
        if params[:nombre].present?
            @autor = Autor.where(nombre: params[:nombre])
        else
            @autor = Autor.all 
        end

        render json: @autor
    end


    def create
        @autor = Autor.new(autor_params)
        if @autor.save
            render json: @autor, statu: :created
        else
            render json: @autor.errors, status: :unprocessable_entity
        end
    end

    def update
        @autor = Autor.find(params[:id])
        if @autor.update(autor_params)
            render json: @autor
        else 
            render json: @autor.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @autor = Autor.find(params[:id])
        if @autor.destroy
            head :ok
        else
            render json: { error: "No se pudo eliminar"}, status: :unprocessable_entity
        end
    end

    private

    def autor_params
        params.require(:autor).permit(:nombre)
    end

    
end
