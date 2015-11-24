class SponsorsController < ApplicationController
  def index
    
  end

  def info
    if current_user && current_user.role == 'sponsor'
      redirect_to new_sponsor_path
    end
  end

  def show
    @sponsor = Sponsor.find(params[:id])
    @leaders = Leadership_team_member.where(sponsor_id: @sponsor.id)  
    unless current_user && @sponsor.user_id == current_user.id
      flash[:alert] = "You do not have permission to access that site area"
      redirect_to sponsors_info_path
    end
    @properties = Property.where(:sponsor_id => @sponsor.id)
  end

  def new
    if current_user && current_user.role == 'sponsor' && current_user.sponsor_id == nil
  	  @sponsor = Sponsor.new
    elsif current_user.sponsor_id != nil
      redirect_to :controller => 'sponsors', :action => 'show', :id => current_user.sponsor_id
    else
      flash[:alert] = "You must become a premium member to access this part of the site."
      redirect_to sponsors_info_path
    end
  end

  def create
  	@sponsor = Sponsor.create(sponsor_params)
    @sponsor.update_attributes(user_id: current_user.id)
    current_user.update_attributes(sponsor_id: @sponsor.id)
  	if @sponsor.save
  		redirect_to @sponsor
  	else
  		flash[:alert] = "error creating Sponsor"
  		render :new
  	end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.destroy
      flash[:notice] = "The sponsor has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "An error occured and your sponsor was not deleted, please try again."
      render :edit
    end
  end

  def edit
  	@sponsor = Sponsor.find(params[:id])
    unless current_user && @sponsor.user_id == current_user.id
      redirect_to index_sponsor_path
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
      if @sponsor.update_attributes(sponsor_params)
      	flash[:notice] = "Update successful"
      	redirect_to sponsor_path
      else
      	flash[:notice] = "Error updating Sponsor"
      	render :new
      end
  end
  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :logo, :synopsis, :address_street, :address_city, :address_state, :address_zipcode, :phone_number, :website, :user_id)
  end
end
