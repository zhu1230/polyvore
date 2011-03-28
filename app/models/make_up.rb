class MakeUp < ActiveRecord::Base
	acts_as_commentable
	 acts_as_voteable
	has_attached_file :pic,:styles => { :medium => "80x80>", :large => "400x400>" ,:home => '200x200>'},:path => ":rails_root/public/system/uploadpics/:id/:style/:filename",:url => "/system/uploadpics/:id/:style/:filename"
	has_many :items
	belongs_to :user
end
