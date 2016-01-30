module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    if !logged_in?
      redirect_to :login
    end
  end

  def require_admin
    if !is_admin?(current_user) then
      flash[:danger] = "Åtgärden kräver administrationsbehörighet. Logga in som administratör"
      redirect_to :login
    end
  end

  def is_admin?(user)
    if user.roles.any?
      current_user.roles.each do |r|
        r.role == 'admin'
      end
    end
  end




end
