class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :almacen

end
