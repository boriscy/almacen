class CreateInventarioDetalles < ActiveRecord::Migration
  def self.up
    create_table :inventario_detalles do |t|
      t.integer :inventario_id
      t.integer :item_id
      t.decimal :cantidad, :precision => 10, :scale => 2
      t.decimal :precio_unitario, :precision => 10, :scale => 2
      t.boolean :activo
      t.date :fecha_vencimiento

      t.timestamps
    end
  end

  def self.down
    drop_table :inventario_detalles
  end
end
