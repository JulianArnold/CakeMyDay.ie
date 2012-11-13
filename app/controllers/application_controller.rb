class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user
  helper_method :logged_in_required
  helper_method :logged_out_required
  helper_method :manager_required, :admin_required

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def logged_in_required
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def logged_out_required
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end
  
  def manager_required
    unless (current_user and current_user.user_group.is_a_manager == true)
      store_location
      flash[:notice] = "You are not authorised to access that page [01]"
      redirect_to root_url
      return false
    end
  end
  
  def admin_required
    unless (current_user and current_user.user_group.is_an_admin == true)
      store_location
      flash[:notice] = "You are not authorised to access that page [02]"
      redirect_to root_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
