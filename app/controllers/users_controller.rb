class UsersController < ApplicationController
  def index
    render template: 'application', layout: 'application'
  end
end
