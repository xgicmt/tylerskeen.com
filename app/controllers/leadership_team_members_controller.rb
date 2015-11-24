class LeadershipTeamMembersController < ApplicationController

  def new
    @teammember = Leadership_team_member.new
  end

  def create
    @leadership_team_member = Leadership_team_member.create(teammember_params)
    @leadership_team_member.update_attributes(sponsor_id: current_user.sponsor_id)
    if @leadership_team_member.save
      redirect_to "/sponsors/#{current_user.sponsor_id}"
    else
      flash[:notice] = "An error occurred during the creation of your team member, please try again."
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @leader = Leadership_team_member.find(params[:id])
    if @leader.destroy
      flash[:notice] = "You have successfully removed that Team Member."
      redirect_to "/sponsors/#{current_user.sponsor_id}"
    else
      flash[:alert] = "An error occurred, please try again."
      redirect_to "/sponsors/#{current_user.sponsor_id}"
    end
  end

  def index
  end

  def show
    @leadership_team_member = Leadership_team_member.find(params[:id])
  end

private

  def teammember_params
    params.require(:leadership_team_member).permit(:name, :synopsis, :picture, :sponsor_id)
  end

end
