class EssaysController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

def new
  @group = Group.find(params[:group_id])
  @essay = Essay.new
end

def create
  @group = Group.find(params[:group_id])
  @essay = Essay.new(essay_params)
  @essay.group = @group
  @essay.user = current_user

  if @essay.save
    redirect_to group_path(@group)
  else
    render :new
  end
end


private

def essay_params
  params.require(:essay).permit(:content)
end

end
