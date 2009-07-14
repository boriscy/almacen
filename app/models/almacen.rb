class Almacen < ActiveRecord::Base
  has_many :inventarios
  has_many :stocks
  has_many :origenes # en Stock
  has_many :destinos # en Stock

  def to_s
    nombre
  end
end
