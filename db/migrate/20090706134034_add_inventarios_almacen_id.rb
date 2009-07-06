class AddInventariosAlmacenId < ActiveRecord::Migration
  def self.up
    add_column :inventarios, :almacen_id, :integer
  end

  def self.down
    remove_column :inventarios, :almacen_id
  end
end
