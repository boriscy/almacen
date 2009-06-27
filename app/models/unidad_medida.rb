class UnidadMedida < ActiveRecord::Base
  has_many :items
  validates_presence_of :nombre, :abreviacion

  def to_s
    "#{nombre} (#{abreviacion})"
  end
end
