class Unidad < ActiveRecord::Base
  has_many :usuarios

  validates_presence_of :nombre, :iniciales

  def to_s
    "#{nombre} (#{iniciales})"
  end

  def entero_to_s
    entero ? "Si" : "No"
  end
end
