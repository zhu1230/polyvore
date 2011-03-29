class SetsController < ApplicationController
	  # before_filter :find_model, :only => [:show, :edit, :update, :destroy]
 before_filter :require_user, :only => [:comment, :create,:update,:destroy]
	  # GET /models
	  # GET /models.xml
	  def index
	    @models = Model.all

	    respond_to do |wants|
	      wants.html # index.html.erb
	      wants.xml  { render :xml => @models }
	    end
	  end

	  # GET /models/1
	  # GET /models/1.xml
	  def show
		@makeup=MakeUp.find params[:id]
	    respond_to do |wants|
	      wants.html # show.html.erb
	      wants.xml  { render :xml => @model }
	    end
	  end

	  # GET /models/new
	  # GET /models/new.xml
	  def new
	    

	    respond_to do |wants|
	      wants.html # new.html.erb
	      wants.xml  { render :xml => @model }
	    end
	  end

	  # GET /models/1/edit
	  def edit
	  end
	  def upload
	  	@makeup=MakeUp.new params[:MakeUp]
	@makeup.user=current_user
		@makeup.save
		redirect_to set_url(@makeup)
	  end
	  
	  # POST /models
	  # POST /models.xml
	  def create
		# puts ">>>>>>>>>>>>>>>>>>>>"+params.to_s
		m=MakeUp.new
		m.title=params[:title]
		m.notes=params[:notes]
		m.user=current_user
		params[:da].each do |data|
			item=Item.new
			val=data.split(',')
			item.product_id=val[0]
			item.top=val[1]
			item.left=val[2]
			item.width=val[3]
			item.height=val[4]
			item.angle=val[5]
			m.items << item
			
		end
		if m.save
			render :text => set_url(m)
		end
	  end
	def comment
		c=MakeUp.find(params[:id]).comments.create(:comment => params[:comment],:user_id => current_user.id)
		render :partial => 'sets/comment',:object => c
		
	end
	def voteup
		if current_user 
		
			if !current_user.voted_on?(MakeUp.find(params[:id]))
				current_user.vote_for(MakeUp.find(params[:id]))
				render :text => 'ok'
			else
				render :text => 'already'
			end
		
		else
			render :text => 'You must login to vote!'
		end
	end
	def votedown
		if current_user 
		unless current_user.voted_on?(MakeUp.find(params[:id]))
		current_user.vote_against(MakeUp.find(params[:id]))
		render :text => 'ok'
		else
		render :text => 'already'
		end	
			else
				render :text => 'You must login to vote!'
			end
	end
	
	

	  # PUT /models/1
	  # PUT /models/1.xml
	  def update
	    respond_to do |wants|
	      if @model.update_attributes(params[:model])
	        flash[:notice] = 'Model was successfully updated.'
	        wants.html { redirect_to(@model) }
	        wants.xml  { head :ok }
	      else
	        wants.html { render :action => "edit" }
	        wants.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /models/1
	  # DELETE /models/1.xml
	  def destroy
	    @model.destroy

	    respond_to do |wants|
	      wants.html { redirect_to(models_url) }
	      wants.xml  { head :ok }
	    end
	  end

	  private
	    def find_model
	      @model = Model.find(params[:id])
	    end

	
end
