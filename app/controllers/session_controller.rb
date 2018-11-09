class SessionsController < ApplicationController
  def new
  end

  def create
      session[:name] = params[:name]
      redirect_to controller: 'companies', action: 'index'
  end

  def destroy
    session.delete :company_id
  end
end
