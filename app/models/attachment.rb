class Attachment < ActiveRecord::Base
	belongs_to :product
		attr_accessor :image_url,:pic
		has_attached_file :pic, :styles => { :medium => "80x80>", :large => "300x300>" ,:home => '200x200>'}
		before_save :download_remote_image, :if => :image_url_provided?
	private

	  def image_url_provided?
	    !self.image_url.blank?
		
	  end

	  def download_remote_image
		# puts do_download_remote_image
	    self.pic = do_download_remote_image
	    # self.image_remote_url = image_url
	  end

	  def do_download_remote_image
	    io = open(URI.parse(image_url))
	    def io.original_filename; base_uri.path.split('/').last; end
	    io.original_filename.blank? ? nil : io
	  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
	  end
end
