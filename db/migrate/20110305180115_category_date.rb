class CategoryDate < ActiveRecord::Migration
  def self.up
		change_table :categories do |t|
		  t.timestamps
		  
		end
  end

  def self.down
		change_table :categories do |t|
		end
  end
end