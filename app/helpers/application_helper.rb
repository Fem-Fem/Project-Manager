module ApplicationHelper
  def current_company
    return Company.find_by(name: session[:name])
  end
end
