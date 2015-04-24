class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts "omniauth #{request.env["omniauth.auth"]}"

    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    puts "Found user #{@user.inspect}"
    sign_in_and_redirect @user
  end

end
