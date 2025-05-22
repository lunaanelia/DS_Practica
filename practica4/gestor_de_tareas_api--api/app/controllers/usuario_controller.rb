class UsuarioController < ApplicationController
    def index
        rails g model Usuario nombre:string correo:string:uniq
        if params[:correo].present?
            @usuarios = Usuario.where(correo: params[:correo])
        else
            @usarios = Usuario.all
        end
        
        render json: @usuarios
    end
    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            render json: @usuario, status: :created
        else
            render json: @usuario.errors, status: :unprocessable_entity
        end
    end

    def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update(usuario_params)
            render json: @usuario
        else
            render json: @usuario.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @usario = Usuario.find(params[:id])
        if @usuario.destroy
            head :ok
        else
            render json: { error: "No se pudo eliminar" }, status: :unprocessable_entity
        end
    end

    private

    def usuario_params
        params.require(:usario).permit(:nombre, :correo)
    end

end
