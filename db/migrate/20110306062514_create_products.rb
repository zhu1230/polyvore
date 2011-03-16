class CreateProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
