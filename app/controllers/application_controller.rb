#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?

  protected

  def admin?
    current_user.admin?
  end

  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end

  def authenticate_admin_user!
    redirect_to root_path flash[:error] = "Nie jesteś administratorem." unless current_user.try(:admin?)
  end


end
