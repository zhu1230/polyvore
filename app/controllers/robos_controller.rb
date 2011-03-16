class RobosController < ApplicationController
	before_filter :require_user
	authorize_resource :class => 'Category'
	layout "admin"
	require 'open-uri'
	require 'nokogiri'
	def index
		@categories=Category.all
	end
	
	def show
		
	end
	
	def fetch
		@categories=Category.all
		@c=Category.find(params[:id])
		@c.products.destroy_all if @c
		@num=0
		(1..(@c.pages.to_i>1 ? 1 : @c.pages.to_i)).each do |page|
		
		doc = Nokogiri::HTML(open(@c.cat_url+"?p="+page.to_s))
		# puts doc.css('.ajax_block_product').size
		doc.css('.ajax_block_product').each do |product|
			p=Product.new
			p.prod_url= (product.css('.thumb > a').blank? ? (product.css('p > a').first)['href'] : (product.css('.thumb > a').first)['href'])
			p.prod_name=(product.css('h3 > a').first).content
			p.prod_price=(product.css('.pprice').first).content
			url='http://amomuito.com'+ (product.css('.thumb > a').blank? ? (product.css('p > a > img').first)['src'] : (product.css('.thumb > a > img').first)['src'])   
			doc2=Nokogiri::HTML(open(p.prod_url))
			get_big_pics(doc2,p)
			get_mini_infos(doc2,p)
			# p.pic=(open(url))
			# p.image_url=url
			p.category=@c
			@num +=1 if p.save
			# p (product.css(''))
		end
	end
		render :action => :index
	end
	
	private
	def get_big_pics(doc,p)
	doc.css('#thumbs_list > ul > li > a > img').each do |img|
		large_pic_url=('http://amomuito.com'+img['src']).gsub('medium','large')
		a=Attachment.new
		a.image_url=large_pic_url
		p.attachments << a
	end
	def get_mini_infos(doc,p)
	p.mini_infos=doc.css('.infos-do-produto > #short_description_block').first.content
	puts "mini_infos = "+p.mini_infos
		
	end
	
	end
	
	
end
