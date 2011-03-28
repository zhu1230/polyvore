class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
		t.integer :product_id
		t.integer :left
		t.integer :top
		t.integer :width
		t.integer :height
		t.string :angle
		t.integer :make_up_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
