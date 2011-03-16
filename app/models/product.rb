class Product < ActiveRecord::Base
	belongs_to :category
	has_many :attachments,:dependent => :destroy

	cattr_reader :per_page
	

	  # validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inaccessible'
	def edit_file=(f)
		self.pic.assign f
		mime_type = MIME::Types.type_for(self.pic_file_name)    
		self.pic_content_type = mime_type.first.content_type.to_s if mime_type.first
	end

end
