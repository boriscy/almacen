class AddFotoToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :foto_file_name, :string
  end

  def self.down
    remove_column :items, :foto_file_name
  end
end
