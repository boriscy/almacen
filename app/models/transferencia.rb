class Transferencia < ActiveRecord::Base
  belongs_to :origen, :class_name => "Almacen", :foreign_key => :almacen_origen_id
  belongs_to :destino, :class_name => "Almacen", :foreign_key => :almacen_destino_id
  has_many :transferencia_detalles
  
end
