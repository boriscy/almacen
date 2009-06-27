class AlterItemsUnidad < ActiveRecord::Migration
  def self.up
    remove_column :items, :unidad_medida
    add_column :items, :unidad_medida_id, :integer
  end

  def self.down
    remove_column :items, :unidad_id
  end
end
