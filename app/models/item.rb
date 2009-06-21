class Item < ActiveRecord::Base
  has_many :inventario_detalles

  def to_s
    "#{nombre} (#{codigo})"
  end
end
