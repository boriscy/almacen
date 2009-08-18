class StocksController < ApplicationController
  before_filter :verificar_permiso

  # listado de productos y cantidades
  def index
    @stocks = Stock.paginate(:page => @page, :order => "items.nombre ASC",
        :include => [{:item => :unidad_medida }, :almacen])
  end

end
