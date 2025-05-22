 class TareasController < ApplicationController
 def index
 @tareas = Tarea.all
 render json: @tareas
 end
 def create
 @tarea = Tarea.new(tarea_params)
 if @tarea.save
 render json: @tarea, status: :created
 else
 render json: @tarea.errors, status: :unprocessable_entity
 end
 end
 def update
 @tarea = Tarea.new(tarea_params)
 if @tarea.update(tarea_params)
 render json: @tarea
 else
 @tarea = Tarea.find(params[:id])
 render json: @tarea.errors, status: :unprocessable_entity
 end
 end
 def destroy
 @tarea = Tarea.find(params[:id])
 if @tarea.destroy
 head :ok
 else
 render json: { error: "Error al eliminar"}, status: :unprocessable_entity
 end
 end
 private
 def tarea_params
 params.require(:tarea).permit(:descripcion, :completada, :usuario)
 end
 end
