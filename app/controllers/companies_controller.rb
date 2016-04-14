class CompaniesController < ApplicationController
  before_action :get_company, only: [:edit, :update, :show]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      flash[:warning] = 'Warning! All fields are mandatory.'
      render :new
    end
  end

   def edit
   end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      flash[:warning] = 'Warning! All fields are mandatory.'
      render :edit
    end
  end

  def show
  end

  private

  def get_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end
end
