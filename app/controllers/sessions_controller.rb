class SessionsController < ApplicationController
  def new
  end

  def create
    @company = Company.find_by(name: params[:company][:name])
    if @company && @company.authenticate(params[:company][:password])
      session[:name] = params[:company][:name]
      redirect_to company_path(@company)
    else
      @errors = "Invalid combination!"
      render :'/companies/login'
    end
  end

  def destroy
    binding.pry
    if session[:name]
      session[:name] = nil
    end
    redirect_to 'companies/account'
  end
end
