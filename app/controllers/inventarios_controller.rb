class InventariosController < ApplicationController
  def index
  end

  def new
    @inventario = Inventario.new(:inventario_detalles_attributes => [{}])
  end
end
