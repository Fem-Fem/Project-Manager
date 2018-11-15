class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:login]

  def login
    render :login
  end

  def create
    if auth
      @company = Company.find_or_create_by_omniauth(auth)
      session[:name] = @company.name
      redirect_to company_path(@company)
    else
      @company = Company.find_by(name: params[:company][:name])
      if @company && @company.authenticate(params[:company][:password])
        session[:name] = params[:company][:name]
        redirect_to company_path(@company)
      else
        @errors = "Invalid combination!"
        render :'/companies/account'
      end
    end
  end

  def destroy
    if session[:name]
      session[:name] = nil
    end
    redirect_to(controller: 'companies', action: 'account')
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end
