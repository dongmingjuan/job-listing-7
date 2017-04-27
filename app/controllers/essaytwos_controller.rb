class EssaytwosController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

def new
  @grouptwo = Grouptwo.find(params[:grouptwo_id])
  @essaytwo = Essaytwo.new
end

def create
  @grouptwo = Grouptwo.find(params[:grouptwo_id])
  @essaytwo = Essaytwo.new(essaytwo_params)
  @essaytwo.grouptwo = @grouptwo
  @essaytwo.user = current_user

  if @essaytwo.save
    redirect_to grouptwo_path(@grouptwo)
  else
    render :new
  end
end


private

def essaytwo_params
  params.require(:essaytwo).permit(:content)
end

end
