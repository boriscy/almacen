class CreateTestModeles < ActiveRecord::Migration
  def self.up
    create_table :test_modeles do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :test_modeles
  end
end
