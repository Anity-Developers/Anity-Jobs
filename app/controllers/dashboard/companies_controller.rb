module Dashboard
    class CompaniesController < DashboardController
        # binding.pry
        before_action :set_company, only: [:edit, :update]
        def index
            @companies = current_user.companies
        end

        def show
        end

        def new
          @company = current_user.companies.build
        end

        def create
            #  binding.pry
            @company = current_user.companies.create(company_params)
            @company.location_id = Location.first.id
            if @company.save
                flash[:notice] = "Company created successfully."
                redirect_to dashboard_companies_path
            else
                render :new
            end
        end

        def edit

        end

        def update
        end

        protected

        def set_company
            @company = Company.find_by_id(params[:id])
        end

        def company_params
            params.require(:company).permit(:name, :location_id, :package_id)
        end
    end
end