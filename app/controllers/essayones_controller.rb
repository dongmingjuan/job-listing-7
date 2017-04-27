class EssayonesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

def new
  @groupone = Groupone.find(params[:groupone_id])
  @essayone = Essayone.new
end

def create
  @groupone = Groupone.find(params[:groupone_id])
  @essayone = Essayone.new(essayone_params)
  @essayone.groupone = @groupone
  @essayone.user = current_user

  if @essayone.save
    redirect_to groupone_path(@groupone)
  else
    render :new
  end
end


private

def essayone_params
  params.require(:essayone).permit(:content)
end

end
