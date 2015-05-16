class WelcomeController < ApplicationController
  def index
    if current_user != nil
      redirect_to user_url(current_user.id)
      return 
    end

    if current_manager != nil
      redirect_to manager_url(current_manager.id)
    end
  end
end
