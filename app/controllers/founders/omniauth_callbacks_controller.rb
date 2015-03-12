class Founders::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    founder = Founder.find_for_facebook_oauth(request.env["omniauth.auth"])

    if founder.persisted?
      sign_in_and_redirect founder, event: :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_founder_registration_url
    end
  end

  def twitter
    founder = Founder.find_for_twitter_oauth(request.env["omniauth.auth"])

    if founder.persisted?
      sign_in_and_redirect founder, event: :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_founder_registration_url
    end
  end

  def linkedin
    auth = env["omniauth.auth"]
    @founder = Founder.connect_to_linkedin(request.env["omniauth.auth"], current_founder)
    if @founder.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @founder, :event => :authentication
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to new_founder_registration_url
    end
  end
end