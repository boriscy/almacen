class CreateVencimientos < ActiveRecord::Migration
  def self.up
    create_table :vencimientos do |t|
      t.integer :stock_id
      t.integer :item_id
      t.decimal :cantidad, :precision => 12, :scale => 2
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :vencimientos
  end
end
