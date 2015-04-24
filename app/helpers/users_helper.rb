module UsersHelper
  def resource_name
    :users
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:users]
  end
end
