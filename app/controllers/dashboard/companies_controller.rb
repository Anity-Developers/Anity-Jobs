module Dashboard
  class CompaniesController < DashboardController
    def show
      @company = Company.find(params[:id])
    end
  end
end