class GrouptwosController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy, :join, :quit]
  before_action :check_permission, only: [:edit, :update, :destroy]
    def index
      @grouptwos = Grouptwo.all
    end

   def new
     @grouptwo = Grouptwo.new
   end

  def create
     @grouptwo = Grouptwo.new(grouptwo_params)
     @grouptwo.user = current_user
     if @grouptwo.save
        current_user.join!(@grouptwo)
       redirect_to grouptwos_path
     else
       render :new
     end
   end

   def show
     @grouptwo = Grouptwo.find(params[:id])
     @essaytwos = @grouptwo.essaytwos.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
   end

    def edit
      @grouptwo = Grouptwo.find(params[:id])
    end

   def update
     @grouptwo = Grouptwo.find(params[:id])

     if @grouptwo.update(grouptwo_params)
        redirect_to grouptwos_path, notice: "Update Success"
     else
        render :edit
     end
   end

   def destroy
    @grouptwo = Grouptwo.find(params[:id])
    @grouptwo.destroy
    flash[:alert] = "grouptwo deleted"
    redirect_to grouptwos_path
  end

  def join
   @grouptwo = Grouptwo.find(params[:id])

    if !current_user.is_member_of?(@grouptwo)
      current_user.join!(@grouptwo)
      flash[:notice] = "加入本讨论版成功！"
    else
      flash[:warning] = "你已经是本讨论版成员了！"
    end

    redirect_to grouptwo_path(@grouptwo)
  end

  def quit
    @grouptwo = Grouptwo.find(params[:id])

    if current_user.is_member_of?(@grouptwo)
      current_user.quit!(@grouptwo)
      flash[:alert] = "已退出本讨论版！"
    else
      flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
    end

    redirect_to grouptwo_path(@grouptwo)
  end



   private

   def check_permission
     if current_user != @grouptwo.user
       redirect_to groupones_path, alert: "You have no permission."
     end
   end

   def grouptwo_params
     params.require(:grouptwo).permit(:title, :description)
   end

  end
