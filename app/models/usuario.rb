class Usuario < ActiveRecord::Base
  belongs_to :unidad
  validates_presence_of :nombre, :paterno, :materno, :ci, :unidad_id
  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end
end
