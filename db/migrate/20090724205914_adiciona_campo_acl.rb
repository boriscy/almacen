class AdicionaCampoAcl < ActiveRecord::Migration
  def self.up
    add_column :usuarios , :rol , :string
  end

  def self.down
    remove_column :usuarios , :rol 
  end
end
