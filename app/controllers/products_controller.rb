class ProductsController < ApplicationController
  def category
	@products=params[:id].blank? ? Product.all.paginate(:per_page => 30,:page => params[:page]) : Category.find(params[:id]).products.all.paginate(:per_page => 30,:page => params[:page])
  end
def cagegory_mix
		if (params[:id].blank? || params[:id]=='0') 
			render :partial => 'mix_all'
		else
			@products= Category.find(params[:id]).products.all.paginate(:per_page => 40,:page => params[:page])
			render :partial => 'products/mix_items',:locals => {:products => @products}
		end

end


  def index
  end

  def show
	@product=Product.find params[:id]
  end

end
