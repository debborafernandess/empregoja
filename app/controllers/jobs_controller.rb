class JobsController < ApplicationController
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
      flash[:error] = 'Não pode ser vazio: title'
      render :new
    end    
  end
  
  private
  
  def job_params
    params.require(:job).permit(:title, :category, :company, :description, :location)
  end
end
