class PropimagesController < ApplicationController


  def index

  end

  def new
    @prop = Property.find(params[:property_id])
    @propimage = Propimage.new 
  end

  def create

  	@propimage = Propimage.new(propimages_params)
  	@propimage.save
  	#@property = Property.find(params[:property_id])
  	#@propimages = @property.propimages
    #@propimage = Propimage.new(propimages_params)

   # if @propimage.save
   # 	redirect_to @property
   # else
   # 	flash["notice"] = "error"
   # 	render :new
   # end
  end

  def edit
  end


private

  def propimages_params
    params.require(:propimage).permit(:image_name, :property_id)
  end


end