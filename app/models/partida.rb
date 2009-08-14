class Partida < ActiveRecord::Base
  has_many :items

  validates_presence_of :nombre, :codigo

  def to_s
    nombre
  end
end
