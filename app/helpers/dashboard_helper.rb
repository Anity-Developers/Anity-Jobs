module DashboardHelper
  def name?(current_user)
    if current_user.name.nil?
      current_user.name
    else
      "Anity"
    end
  end
end
