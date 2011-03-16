class AddFieldsUsers < ActiveRecord::Migration
  def self.up
		change_table :users do |t|
		  t.string :address
		  t.string :country
		  t.string :state
		  t.string :city
		  t.string :zipcode
		  t.boolean :active
		end
  end

  def self.down
		change_table :users do |t|
		end
  end
end