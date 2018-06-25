class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  	def remote_ip
      if request.remote_ip == '127.0.0.1'
        @client_ip = "60.49.85.80"
      else
  			request.remote_ip
  		end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :birthday, :country, :state, :city])
    end
end
