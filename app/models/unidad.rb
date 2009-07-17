class Unidad < ActiveRecord::Base
  has_many :usuarios
  def to_s
    "#{nombre} (#{iniciales})"
  end

  def entero_to_s
    entero ? "Si" : "No"
  end
end
