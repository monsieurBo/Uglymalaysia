# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    generic_callback('facebook')
  end

  def google_oauth2

    generic_callback('google_oauth2')
  end

  def twitter
    generic_callback('twitter')
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end

  def generic_callback(provider)
    puts "in omni cntroller!"
    auth_hash = request.env['omniauth.auth']
    @authentication = Authentication.find_for_oauth(auth_hash)

    @user = @authentication.user || current_user
    @user.skip_confirmation!
    # if previously registered and logged in before
    if !@user.nil?
      @authentication.update_token(auth_hash)
    else    #if user sign up/log in for first time
      @user = User.find_by(email: auth_hash.info.email)
      puts @user
      puts ""
    
      @user.skip_confirmation!
      if !@user.nil?  # creates authentication if registered before
        @user.authentications << @authentication
        @authentication.update_token(auth_hash)
      else  # creates new account if not registered before
        @user = User.from_omniauth(@authentication, auth_hash)
        @authentication.update_token(auth_hash)
      end
    end

    # sign in @user
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = auth_hash
      redirect_to new_user_registration_url
    end
  end
end
