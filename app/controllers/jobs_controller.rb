class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :join, :quit]

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC')
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC')
    else
      Job.published.recent
    end
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end
  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes.order("created_at DESC")

    if @job.is_hidden
      flash[:warning] = "This job already archived"
      redirect_to root_path
    end
  end
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end
  def join
    @job = Job.find(params[:id])

    if !current_user.is_member_of?(@job)
      current_user.join!(@job)
      flash[:notice] = "加入本讨论版成功!"
    end

    redirect_to job_path(@job)
  end

  def quit
    @job = Job.find(params[:id])

    if current_user.is_member_of?(@job)
      current_user.quit!(@job)
      flash[:alert] ="已退出本讨论版"
    end

    redirect_to job_path(@job)
  end
  private
  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :description, :is_hidden)
  end


end
