class ResumesController < ApplicationController
  before_action :authenticate_user!
  layout "front"
  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end
  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      flash[:notice] = "成功提交post"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])

    if @resume.update(resume_params)
      flash[:notice] = "修改post成功！"
      redirect_to post_resumes_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:job_id])

    @resume.destroy
    flash[:alert] = "Post 已删除"
    redirect_to post_resumes_path
 end



  private
  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end

end
