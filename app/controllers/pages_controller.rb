class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    case current_user.role
    when "admin"
      render "dashboards/admin"
    when "agent"
      render "dashboards/agent"
    when "rider"
      render "dashboards/rider"
    when "warehouse"
      render "dashboards/warehouse"
    when "client"
      render "dashboards/client"
    else
      render plain: "Role not assigned"
    end
  end
end
