class ExtrasController < ApplicationController


  def index

  end

  def new
    @prop = Property.find(params[:property_id])
    @extra = Extra.new 
  end

  def create
  	@extra = Extra.new(extras_params)
  	@extra.save
  end

  def edit
  end

  def destroy 
    @extra = Extra.find(params[:id])
    @property = @extra.property_id
    if @extra.destroy
      flash[:notice] = "Field deleted."
      redirect_to "/property/#{@property}/edit"
    else
      flash[:alert] = "There was an error deleting your property, please try again."
      redirect_to "/property/#{@property}/edit"
    end
  end
private

  def extras_params
    params.require(:extra).permit(:title, :body, :property_id)
  end


end