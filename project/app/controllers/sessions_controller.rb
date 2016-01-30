class SessionsController < ApplicationController
  #GET
  #Show login form
  def new
    if !current_user.nil? then
      redirect_to user_path(current_user)
    end
  end

  #POST
  #Login (Create new session)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Fel email eller lösenord"
      render 'new'
    end
  end

  #POST
  #Logout (Destroy session)
  def destroy
    log_out
    redirect_to root_path
  end

end
