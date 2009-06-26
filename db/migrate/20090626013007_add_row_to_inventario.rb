class AddRowToInventario < ActiveRecord::Migration
  def self.up
    add_column :inventarios, :total, :decimal, :precision => 12, :scale => 2
  end

  def self.down
  end
end
