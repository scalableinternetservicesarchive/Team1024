class UsersController < ApplicationController
  def index
    render template: 'application', layout: 'index'
  end
end
