module CreatorsHelper

  def current_creator
    @current_creator ||= Creator.find_by(id: session[:creator_id])
  end

  def creator_logged_in?
    !current_creator.nil?
  end
end
