class CompaniesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:require_login, :signup, :login, :account]

  def account
    binding.pry
    render :account
  end

  def index
    @companies = Company.all
  end

  def signup
    render :signup
  end

  def authenticate_signup
    @company = Company.new(name: params[:company][:name], password: params[:company][:password], location: params[:company][:location], motto: params[:company][:motto])
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
      session[:name] = params[:company][:name]
    else
      render :index
    end
  end

  def login
    render :login
  end

  def logout
    redirect_to 'sessions/destroy'
    if session[:name]
      session[:name] = nil
    end
    render :account
  end

  def show
    @company = Company.find(params[:id])
  end

end
