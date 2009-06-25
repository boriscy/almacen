class InventariosController < ApplicationController
  
  def index
    @inventarios = Inventario.all
  end

  def new
    @inventario = Inventario.new(:inventario_detalles_attributes => [{}])
  end
  
  def create
    @inventario = Inventario.new(params[:inventario])
    if @inventario.save
      redirect_to inventarios_path      
    else
      render "new"
    end
  end
  def show
    @inventario = Inventario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventario }
    end
  end
end
