class User::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  skip_before_filter :authenticate
  # GET /resource/sign_in
  def new
    ## Copied code from 'devise' gem and changed redirecting address.
    if !self.resource
      self.resource = resource_class.new;
    end
    respond_to do |format|
        format.html { render '/application', layout: 'index' }
    end
  end

  # POST /resource/sign_in
  def create
    ## Copied code from 'devise' gem and changed redirecting address.
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_to do |format|
      format.html { render '/application', layout: 'index' }
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
                      args = no_input.dup.push scope: resource_name
                      warden.authenticate?(*args)
                    else
                      warden.authenticated?(resource_name)
                    end

  end
end
