class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:resume_id])
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:resume_id])
    @comment = Comment.new(comment_params)
    @resume.job = @job
    @comment.resume = @resume
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "评论成功"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
end
