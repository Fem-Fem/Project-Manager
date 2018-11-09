class CompaniesController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:signup, :login, :account]

  def index
    session[:name] = "Apple"
    @companies = Company.all
  end

  def signup
    @company = Company.new(name: params[:name], password: params[:password], location: params[:location], motto: params[:motto])
    if @company.valid?
      @company.save
      redirect to company_path(@company)
      session[:name] = params[:name]
    else
      render :new
    end
  end

  def login
    render :login
  end

  def authenticate_login
    @company = Company.find(params[:name])
    if @company && @company.authenticate(params[:name])
      session[:name] = params[:name]
      redirect to company_path(@company)
    else
      render :account
    end
  end

  def logout
    if session[:name]
      session[:name] = nil
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :company_id
  end
end
