class AddPicToMakeUp < ActiveRecord::Migration
  def self.up
		change_table :make_ups do |t|
		  		t.string :pic_file_name
				t.string  :pic_content_type
				t.integer :pic_file_size
				t.datetime  :pic_updated_at
		end
  end

  def self.down
		change_table :make_ups do |t|
		end
  end
end