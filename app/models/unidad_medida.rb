class UnidadMedida < ActiveRecord::Base
  has_many :items
  validates_presence_of :nombre, :abreviacion
  cattr_reader :per_page
  @@per_page = 30
  def to_s
    "#{nombre} (#{abreviacion})"
  end
end
