class GrouponesController < ApplicationController
  def index
    @groupones = Groupone.all
  end

 def new
   @groupone = Groupone.new
 end

def create
   @groupone = Groupone.new(groupone_params)
   @groupone.user = current_user
   if @groupone.save
     redirect_to groupones_path
   else
     render :new
   end
 end

 def show
   @groupone = Groupone.find(params[:id])
 end

  def edit
    @groupone = Groupone.find(params[:id])
  end

 def update
   @groupone = Groupone.find(params[:id])

   if @groupone.update(groupone_params)
      redirect_to groupones_path, notice: "Update Success"
   else
      render :edit
   end
 end

 def destroy
  @groupone = Groupone.find(params[:id])
  @groupone.destroy
  flash[:alert] = "groupone deleted"
  redirect_to groupones_path
end


 private

 def groupone_params
   params.require(:groupone).permit(:title, :description)
 end
end
