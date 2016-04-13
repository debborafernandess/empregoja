class JobsController < ApplicationController
  before_filter :get_companies, only: [:new, :create]

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      flash[:notice] = @job.errors
      render :new, collection: @companies
    end
  end

  private

  def job_params
    params.require(:job)
      .permit(:title, :location, :category, :description, :featured,
             :company_id)
  end

  def get_companies
    @companies = Company.all
  end
end
