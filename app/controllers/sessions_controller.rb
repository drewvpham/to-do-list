class SessionsController < ApplicationController
  def new

  end

  def create

    if auth_hash=request.env['omniauth.auth']
      user= User.find_or_create_by_omniauth(auth_hash)
      session[:user_id]=user.id
      redirect_to lists_path
      #
      # oauth_email=request.env['omniauth.auth']['info']['email']
      # username=request.env['omniauth.auth']['info']['nickname']
      # image= request.env['omniauth.auth']['info']['image']
      # location = request.env['omniauth.auth']['extra']['location']
      # if user=User.find_by(email: oauth_email)
      #   session[:user_id]=user.id
      #   redirect_to users_path
      #
      # else
      #   user=User.new(email: oauth_email, password: SecureRandom.hex, username:username )
      #   if user.save
      #   session[:user_id]=user.id
      #
      #   redirect_to users_path
      # end
      #
      # end
    else
      user=User.find_by(email: user_params[:email])
      if user && user.authenticate(user_params[:password])
        session[:user_id]=user.id
        redirect_to lists_path
      else
        flash[:login_error]='Invalid credentials'
        redirect_to :back
      end
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end
