module Dashboard
  class CompaniesController < DashboardController
    before_action :require_login

    def edit
      @company = Company.find(params[:id])
    end

    def update
      @company = Company.find(params[:id])
      if @company.update!(company_params)
        flash[:notice] = "Company updated successfully."
        redirect_to dashboard_company_path(@company)
      else
        render :edit
      end
    end

    def show
      @company = Company.find(params[:id])
    end

    private

    def company_params
      params.require(:company).permit(:name, :description, :location_id, :logo)
    end
  end
end
