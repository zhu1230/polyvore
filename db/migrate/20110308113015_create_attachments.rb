class CreateAttachments < ActiveRecord::Migration
  def self.up
		change_table :products do |t|
		  t.string :mini_infos
		  
		end
    create_table :attachments do |t|
		t.string :pic_file_name
		t.string  :pic_content_type
		t.integer :pic_file_size
		t.datetime  :pic_updated_at
		t.integer :product_id
		  end
	
  end

  def self.down
		change_table :products do |t|
		end
    drop_table :attachments
  end
end