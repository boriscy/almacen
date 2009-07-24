class Vencimiento < ActiveRecord::Base
  belongs_to :item
  belongs_to :stock
end
