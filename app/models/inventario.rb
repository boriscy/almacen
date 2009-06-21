class Inventario < ActiveRecord::Base
  has_many :inventario_detalles
  accepts_nested_attributes_for :inventario_detalles
end
