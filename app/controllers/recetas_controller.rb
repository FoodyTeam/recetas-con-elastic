class RecetasController < ApplicationController

def index
  @recetas = Receta.all
end
 
def show
  @receta = Receta.find params[:id]
end
 
def new
end
 
def create
  @receta = Receta.new receta_params
  if @receta.save
    redirect_to @receta
  else
    render 'new'
  end
end
 
private
  def receta_params
    params.require(:receta).permit :titulo, :ingredientes, :modo_preparacion
  end
end
