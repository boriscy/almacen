class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :almacen
  
  default_scope :conditions => { :activo => true }
  validates_presence_of :item_id

end
