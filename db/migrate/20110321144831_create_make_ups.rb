class CreateMakeUps < ActiveRecord::Migration
  def self.up
    create_table :make_ups do |t|
	 t.string :title
	 t.text :notes
	 t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :make_ups
  end
end
