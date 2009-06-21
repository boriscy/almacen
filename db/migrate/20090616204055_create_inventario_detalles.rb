class CreateInventarioDetalles < ActiveRecord::Migration
  def self.up
    create_table :inventario_detalles do |t|
      t.integer :inventario_id
      t.integer :item_id
      t.decimal :cantidad
      t.boolean :activo

      t.timestamps
    end
  end

  def self.down
    drop_table :inventario_detalles
  end
end
