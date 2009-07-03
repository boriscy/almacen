class CreateInventarioItems < ActiveRecord::Migration
  def self.up
    create_table :inventario_items do |t|
      t.integer :item_id
      t.decimal :cantidad
      t.boolean :activo
      t.decimal :valor_inventario
      t.string :estado

      t.timestamps
    end
  end

  def self.down
    drop_table :inventario_items
  end
end
