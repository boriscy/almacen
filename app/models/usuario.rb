class Usuario < ActiveRecord::Base
  belongs_to :unidad
  validates_presence_of :nombre, :paterno, :materno, :ci, :unidad_id
  cattr_reader :per_page
  @@per_page = 1
  def nombre_completo
    "#{nombre} #{paterno} #{materno}"
  end
end
