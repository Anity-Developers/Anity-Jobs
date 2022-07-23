class CompaniesController < ApplicationController
  before_action :require_login

  def index
    @companies = Company.all
    @country = request.location.country.to_s.upcase
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      flash[:notice] = "Company created successfully."
      redirect_to @company
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :location_id)
  end
end
