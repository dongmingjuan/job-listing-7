class GrouponesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  # before_action :check_permission, only: [:edit, :update, :destroy]
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
    #  current_user.join!(@groupone)
     redirect_to groupones_path
   else
     render :new
   end
 end

 def show
   @groupone = Groupone.find(params[:id])
   @essayones = @groupone.essayones.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
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

# def join
#  @groupone = Groupone.find(params[:id])
#
#   if !current_user.is_member_of?(@groupone)
#     current_user.join!(@groupone)
#     flash[:notice] = "加入本讨论版成功！"
#   else
#     flash[:warning] = "你已经是本讨论版成员了！"
#   end
#
#   redirect_to groupone_path(@groupone)
# end
#
# def quit
#   @groupone = Groupone.find(params[:id])
#
#   if current_user.is_member_of?(@groupone)
#     current_user.quit!(@groupone)
#     flash[:alert] = "已退出本讨论版！"
#   else
#     flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
#   end
#
#   redirect_to groupone_path(@groupone)
# end



 private

 # def check_permission
 #   if current_user != @groupone.user
 #     redirect_to groupones_path, alert: "You have no permission."
 #   end
 # end

 def groupone_params
   params.require(:groupone).permit(:title, :description)
 end
end
