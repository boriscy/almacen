class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :almacen_id
      t.integer :item_id
      t.decimal :cantidad, :precision => 10, :scale => 2
      t.decimal :valor_inventario, :precision => 12, :scale => 2
      t.boolean :activo
      t.string :estado
      t.string :accion
      t.date :fecha_vencimiento

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
