class JobsController < ApplicationController
  def show
    @job = Job.includes(:company).where(params[:id]).first
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    redirect_to @job
  end

  private

  def job_params
    params.require(:job)
      .permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
