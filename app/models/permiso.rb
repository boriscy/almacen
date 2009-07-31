class Permiso < ActiveRecord::Base
  belongs_to :rol

  serialize :acciones

  before_save :cambiar_valor_acciones

  # Actualiza los valores de las acciones para que sean true, false
  # en ves de "0" o "1"
  def cambiar_valor_acciones
    acciones.each{ |k,v|  acciones[k] = (v == "1") }
  end

end
