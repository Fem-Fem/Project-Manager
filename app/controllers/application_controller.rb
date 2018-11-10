class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    if !current_company
      redirect_to(controller: 'companies', action: 'account')
    end
  end

  def already_logged_in
    if current_company
      redirect_to(controller: 'companies', action: 'index')
    end
  end
end
