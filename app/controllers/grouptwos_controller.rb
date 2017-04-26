class GrouptwosController < ApplicationController
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
       redirect_to grouptwos_path
     else
       render :new
     end
   end

   def show
     @grouptwo = Grouptwo.find(params[:id])
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


   private

   def grouptwo_params
     params.require(:grouptwo).permit(:title, :description)
   end

  end
