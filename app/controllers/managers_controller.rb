class ManagersController < ApplicationController
  def dashboard
    render 'managers/manager_dashboard', layout: 'manager/manager_dashboard'
  end
end
