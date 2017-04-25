class Account::ResumesController < ApplicationController
  before_action :authenticate_user!
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')
  end
end
